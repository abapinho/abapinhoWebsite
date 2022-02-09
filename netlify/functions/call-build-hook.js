const handler = async function(event, context) {
  fetch(process.env.BUILD_HOOK_URL, {
    method: 'POST'
  });
  return {
    statusCode: 200,
  };
};

module.exports.handler = handler;
