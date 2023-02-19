const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const message = new Schema({
  message: { type: String, required: true },
  senderId: { type: String, required: true },
  timestamp: { type: Date, default: new Date() },
});

const messageGroup = new Schema({
  messages: [
    {
      type: message,
      required: true,
    },
  ],
  createdAt: {
    type: Date,
    default: new Date(),
  },
  groupId: {
    type: String,
    required: true,
  },
});
module.export.MessageModel = mongoose.model("MessageGroup", messageGroup);
module.export.Message = mongoose.model("Message", message);
