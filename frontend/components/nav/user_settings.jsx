import React from 'react'
import { withRouter } from 'react-router'

class UserSettings extends React.Component {
  constructor(props) {
    super(props)
    this.onClick = this.onClick.bind(this)
  }

  onClick(e) {
    e.preventDefault()
    this.props.logout()
    // this.props.history.push('/');
  }

  render() {
    const signedIn = () => {
      return (
        <div>
          <div className="user-settings-options">
            <button className="user-settings-button" onClick={this.onClick}>
              LOGOUT
            </button>
          </div>
        </div>
      )
    }

    const noUser = () => {
      return (
        <div>
          <div className="user-settings-options">
            <button
              className="user-settings-button"
              id="login"
              onClick={() => this.props.openModal('start-login')}
            >
              LOGIN
            </button>
            <button
              className="user-settings-button"
              id="signup"
              onClick={() => this.props.openModal('start-signup')}
            >
              SIGN UP
            </button>
          </div>
        </div>
      )
    }

    return this.props.currentUser ? signedIn() : noUser()
  }
}

export default withRouter(UserSettings)
