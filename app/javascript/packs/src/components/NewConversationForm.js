import React from 'react';
import { API_ROOT, HEADERS } from '../constants';

class NewConversationForm extends React.Component {
  state = {
    title: ''
  };

  handleChange = e => {
    this.setState({ title: e.target.value });
  };

  handleSubmit = e => {
    e.preventDefault()
    fetch(`${API_ROOT}/conversations?meeting_id=${this.props.meetingId}`, {
      method: 'POST',
      headers: HEADERS,
      credentials: 'same-origin',
      body: JSON.stringify(this.state)
    });
    this.setState({ title: '' });
  };

  render = () => {
    return (
      <div className="newConversationForm">
        <form onSubmit={this.handleSubmit}>
          <div class="row">
            <div class="col-md-8">
              <input
                type="text"
                value={this.state.title}
                onChange={this.handleChange}
                class="form-control"
                placeholder="New conversation topic"
              />
            </div>
            <div class="col-md-3">
              <input value="Create Topic" type="submit" class="btn btn-success"/>
            </div>
          </div>
        </form>
      </div>
    );
  };
}

export default NewConversationForm;
