import React from 'react';
import NewMessageForm from './NewMessageForm';

const MessagesArea = ({
  conversation: { id, title, messages },
}) => {
  return (
    <div className="messagesArea">
      <div class="card rounded-lg border border-success ">
        <div class="card-header bg-success">
          <h2 class="card-title text-center text-white">{title}</h2>
        </div>
        <ul>{orderedMessages(messages)}</ul>
        <NewMessageForm conversation_id={id} />
      </div>
    </div>
  );
};

export default MessagesArea;

// helpers

const orderedMessages = messages => {
  const sortedMessages = messages.sort(
    (a, b) => new Date(a.created_at) - new Date(b.created_at)
  );
  return sortedMessages.map(message => {
    console.log(message);
    return <li key={message.id}><div class="row"><div class="col-md-8"><strong>{message.user}:</strong>{message.text}</div><div class="col-md-4"><small>{message.time}</small></div></div></li>;
  });
};
