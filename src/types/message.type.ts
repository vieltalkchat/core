import { MessageType } from "../enums/message.enum";

export interface Message {
  id: string;
  type: MessageType;
  content: string;
  senderId: string;
  createdAt: Date;
}
