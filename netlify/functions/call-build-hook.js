import fetch from "node-fetch";

const URL = process.env.BUILD_HOOK_URL;

exports.handler = async (event, context) => {
  console.log("BUILD_HOOK_URL: %s", URL);
  return fetch(URL, {method: 'POST'})
    .then(data => ({
      statusCode: 200
    }))
    .catch(error => ({ statusCode: 422, body: String(error) }));
};
