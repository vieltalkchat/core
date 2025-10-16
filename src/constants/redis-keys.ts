export const REDIS_KEYS = {
  USER_SOCKET: (userId: string, deviceId: string) =>
    `socket:user:${userId}:${deviceId}`,
};
