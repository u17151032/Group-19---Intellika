import { Photo } from './photo';

export interface User {
    id: number;
    username: string;
    firstName: string;
    lastname: string;
    age: number;
    role: string;
    lastActive: Date;
    photoUrl: string;
    city: string;
    service: string;
    country: string;
    BusinessDescription?: string;
    photos?: Photo[];




}
