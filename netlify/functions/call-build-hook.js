import fetch from "node-fetch";

exports.handler = async (event, context) => {
  fetch(process.env.BUILD_HOOK_URL, {method: 'POST'});
  return {
    statusCode: 200,
  };
};
