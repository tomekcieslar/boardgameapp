import React from 'react';
import ReactDOM from 'react-dom';
import { ActionCableProvider } from 'react-actioncable-provider';
import { API_WS_ROOT } from './src/constants';
import App from './src/App'

document.addEventListener('DOMContentLoaded', () => {
  var rootElement = document.getElementById('chatApp')
  ReactDOM.render(
    <ActionCableProvider url={API_WS_ROOT}>
      <App meetingId={rootElement.dataset.meeting}/>
    </ActionCableProvider>,
    rootElement
  )
})
