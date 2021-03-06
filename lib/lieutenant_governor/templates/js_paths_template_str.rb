module LieutenantGovernor
  module Templates
    JS_PATHS_TEMPLATE_STR =
    %{
const STRING = 'string';
const PARAM = 'param';

const makeFullURL = ({
  path = [],
  params = [],
  query = {},
} = {}) => {

  const requestPath = makeRequestPath({
    path,
    params,
  });
  const queryStrings = makeQueryStrings(query);
  return queryStrings.length > 0
  ? `${requestPath}?${queryStrings}`
  :requestPath;
}

const makeRequestPath = ({ path, params }) => {
  const isArray = obj => {
    return Object.prototype.toString.call(obj) === '[object Array]';
  }

  if(!isArray(params)) {
    throw 'params argument must of type array';
  }

  const numRequiredParams = path.reduce((acc, param) => {
    return acc + (param.type == PARAM);
  }, 0);

  if(params.length !== numRequiredParams) {
    throw `params: ${params.length} given, but ${numRequiredParams} required`;
  }

  let numUsedParams = 0;
  return path.map(obj => {
    if(obj.type === STRING) {
      return obj.name;
    } else if(obj.type === PARAM) {
      numUsedParams+=1;
      return params[numUsedParams - 1];
    }
  }).join('/');
}

const makeQueryStrings = a => {
  const s = [];
  const rbracket = /\\[\\]$/;
  const isArray = obj => {
    return Object.prototype.toString.call(obj) === '[object Array]';
  }

  const add = (k, v) => {
      v = typeof v === 'function'
      ? v()
      : v === null ? '' : v === undefined ? '' : v;
      s[s.length] = `${encodeURIComponent(k)}=${encodeURIComponent(v)}`;
    };

  const buildParams = (prefix, obj) => {
      let i, len, key;

      if (prefix) {
        if (isArray(obj)) {
          for (i = 0, len = obj.length; i < len; i++) {
            if (rbracket.test(prefix)) {
              add(prefix, obj[i]);
            } else {
              buildParams(
                `${prefix}[${typeof obj[i] === 'object' ? i : ''}]`,
                obj[i]
              );
            }
          }
        } else if (obj && String(obj) === '[object Object]') {
          for (key in obj) {
            buildParams(`${prefix}[${key}]`, obj[key]);
          }
        } else {
          add(prefix, obj);
        }
      } else if (isArray(obj)) {
        for (i = 0, len = obj.length; i < len; i++) {
          add(obj[i].name, obj[i].value);
        }
      } else {
        for (key in obj) {
          buildParams(key, obj[key]);
        }
      }
      return s;
    };

  return buildParams('', a).join('&');
};

<% @routes.each do |n, s_path| %>

const <%= n %>Path = [
<% s_path.split('/').each_with_index do |frag, idx| %>
  <% next if frag.blank? %>
  <% if frag[0] == ':' %>
    {
      type: PARAM
    } <%= ',' if idx < s_path.split('/').count - 1 %>
  <% else %>
  {
    type: STRING,
    name: '<%= frag %>'
  } <%= ',' if idx < s_path.split('/').count - 1 %>
  <% end %>
<% end %>
];
export function <%= n %>({ // pluralized model name
  params = [], // params must be given in order inserted
  query = {},
} = {}) {

  return makeFullURL({
    path: <%= n %>Path,
    params,
    query,
  });
}

<% end %>
  }
  end
end
