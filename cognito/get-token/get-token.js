global.fetch = require('node-fetch')
var aws_cognito = require('amazon-cognito-identity-js')

var id = process.argv[2]
var password = process.argv[3]
var user_pool_id = process.env.USER_POOL_ID
var client_id = process.env.CLIENT_ID

console.log("id =", id)
console.log("pass =", password)
console.log("user_pool_id =", user_pool_id)
console.log("client_id =", client_id)
console.log("================================")

var user_pool = new aws_cognito.CognitoUserPool({ UserPoolId: user_pool_id, ClientId: client_id });
var cognito_user = new aws_cognito.CognitoUser({ Username: id, Pool: user_pool });
var authentication_details = new aws_cognito.AuthenticationDetails({ Username : id, Password : password });

cognito_user.authenticateUser(authentication_details, {
    onSuccess(result) {
        let access_token = result.getAccessToken().getJwtToken(); // こちらを使用してもAPI Gatewayの認証が通らない
        let id_token = result.idToken.jwtToken;
        console.log(id_token);
    },
    onFailure(err) {
        console.error(err);
    },
    newPasswordRequired(user_attributes, required_attributes) {
        cognito_user.completeNewPasswordChallenge(authentication_details.password, user_attributes, this);
    },
});
