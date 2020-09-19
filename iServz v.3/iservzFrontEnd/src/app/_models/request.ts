export interface Request {
    id: number;
    senderId: number;
    senderKnownAs: string;
    senderPhotoUrl: string;
    recipientId: number;
    recipientKnownAs: string;
    recipientPhotoUrl: string;
    description: string;//content
    date: string;//new
    time: string;//new
    address1: string;//new
    address2: string;//new
    address3: string;//new
    isRead: boolean;
    dateRead: Date;
    messageSent: Date;
}
