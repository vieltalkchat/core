import { UserRole } from "../enums/user.enum";

export interface User {
  id: string;
  name: string;
  role: UserRole;
  createdAt: Date;
}
