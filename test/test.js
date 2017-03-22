import assert from 'assert';
import expect from 'expect.js';
import {
  makeQueryStrings,
  makeRequestPath,
  makeFullURL,
  ApiQuestionsPath,
  ApiQuestions,
  ApiQuestionAnswersPath,
  ApiQuestionAnswers
} from './paths';

describe('makeQueryStrings()', () => {
  it('should return name=jack when value is { name: jack }', () => {
    assert.equal('name=jack', makeQueryStrings({ name: 'jack' }));
  });

  it('should return empty string when value is {}', () => {
    assert.equal('', makeQueryStrings({}));
  });

  it(`should return firstName=jack&lastName=johnson when value is
    { firstName:jack, lastName:johnson }`, () => {
    assert.equal('', makeQueryStrings({}));
  });

  it(`should return a%5B%5D=2&a%5B%5D=3&a%5B%5D=4 when value is
    { a: [ 2, 3, 4 ] }`, () => {
      assert.equal(
        'a%5B%5D=2&a%5B%5D=3&a%5B%5D=4',
        makeQueryStrings({ a: [ 2, 3, 4 ] })
      );
    }
  );
});

describe('makeRequestPath({ path, params })', () => {
  it(`should return "api/questions" when
    {
      path: ApiQuestionsPath
      params: []
    }`, () => {
      assert.equal(
        'api/questions',
        makeRequestPath({ path: ApiQuestionsPath, params: [] })
      );
    }
  );

  it(`should return "api/questions/123/answers" when
    {
      path: ApiQuestionAnswersPath
      params: [ 123 ]
    }`, () => {
      assert.equal(
        'api/questions/123/answers',
        makeRequestPath({
          path: ApiQuestionAnswersPath,
          params: [ 123 ]
        })
      );
    }
  );
});

describe('makeFullURL({ path, params, query })', () => {
  it(`should return "api/questions" when
    {
      path: ApiQuestionsPath
      params: [],
      query: {}
    }`, () => {
      assert.equal(
        'api/questions',
        makeFullURL({
          path: ApiQuestionsPath,
          params: [],
          query: {}
        })
      );
    }
  );

  it(`should return "api/questions?name=jack" when
    {
      path: ApiQuestionsPath
      params: [],
      query: { name: "jack" }
    }`, () => {
      assert.equal(
        'api/questions?name=jack',
        makeFullURL({
          path: ApiQuestionsPath,
          params: [],
          query: { name: 'jack' }
        })
      );
    }
  );

  it(`should return
    "api/questions/123/answers?firstName=jack&lastName=johnson" when
    {
      path: ApiQuestionAnswersPath
      params: [ 123 ],
      query: {
        firstName: "jack",
        lastName: "johnson"
      }
    }`, () => {
      assert.equal(
        'api/questions/123/answers?firstName=jack&lastName=johnson',
        makeFullURL({
          path: ApiQuestionAnswersPath,
          params: [ 123 ],
          query: {
            firstName: 'jack',
            lastName: 'johnson'
          }
        })
      );
    }
  );
});
