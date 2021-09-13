import * as UserApiUtils from '../util/user_api_util';

export const RECEIVE_USER = 'RECEIVE_USER';

export const receiveUser = (user) => ({
	type: RECEIVE_USER,
	user
});

export const fetchUser = (userId) => (dispatch) =>
  UserApiUtils.fetchUser(userId)
  .then((user) =>{ 
    return dispatch(receiveUser(user))});
