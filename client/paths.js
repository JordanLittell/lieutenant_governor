import {
  makeFullURL,
  PARAM,
  STRING,
} from './utility.js';

const questionsPath = [ // generated for each endpoint
  {
    type: STRING,
    name: 'api',
  },
  {
    type: STRING,
    name: 'questions',
  },
  {
    type: PARAM,
  },
];

export function questions({ // pluralized model name
  params = [], // params must be given in order inserted
  query = {},
} = {}) {

  return makeFullURL({
    path: questionsPath,
    params,
    query,
  });
}
