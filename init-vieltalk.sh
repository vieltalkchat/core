#!/bin/bash
set -e

echo "🚀 Initializing @vieltalk package structure..."

# Create base folder
mkdir -p src/{enums,constants,types,utils}
mkdir -p dist

# Initialize npm project
# npm init -y
# sudo npm pkg set name="@vieltalk/core"
# sudo npm pkg set version="0.1.0"
# sudo npm pkg set type="module"
# sudo npm pkg set main="dist/index.js"
# sudo npm pkg set module="dist/index.mjs"
# sudo npm pkg set types="dist/index.d.ts"
# sudo npm pkg set scripts.build="tsup src/index.ts --format esm,cjs --dts"
# sudo npm pkg set scripts.dev="tsup src/index.ts --watch"

# Create .gitignore
cat > .gitignore <<EOF
node_modules
dist
.env
EOF

# Create tsconfig.json
cat > tsconfig.json <<EOF
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "ESNext",
    "moduleResolution": "NodeNext",
    "declaration": true,
    "outDir": "dist",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "baseUrl": "./src"
  },
  "include": ["src/**/*"]
}
EOF

# --- ENUMS ---
cat > src/enums/message.enum.ts <<EOF
export enum MessageType {
  TEXT = "TEXT",
  IMAGE = "IMAGE",
  VIDEO = "VIDEO",
  AUDIO = "AUDIO",
}
EOF

cat > src/enums/user.enum.ts <<EOF
export enum UserRole {
  ADMIN = "ADMIN",
  USER = "USER",
  GUEST = "GUEST",
}
EOF

cat > src/enums/index.ts <<EOF
export * from "./message.enum";
export * from "./user.enum";
EOF

# --- CONSTANTS ---
cat > src/constants/redis-keys.ts <<EOF
export const REDIS_KEYS = {
  USER_SOCKET: (userId: string, deviceId: string) =>
    \`socket:user:\${userId}:\${deviceId}\`,
};
EOF

cat > src/constants/system-events.ts <<EOF
export const SYSTEM_EVENTS = {
  CONTACT_SYNCED: "contact-synced",
  MESSAGE_RECEIVED: "message-received",
  USER_CONNECTED: "user-connected",
};
EOF

cat > src/constants/index.ts <<EOF
export * from "./redis-keys";
export * from "./system-events";
EOF

# --- TYPES ---
cat > src/types/message.type.ts <<EOF
import { MessageType } from "../enums/message.enum";

export interface Message {
  id: string;
  type: MessageType;
  content: string;
  senderId: string;
  createdAt: Date;
}
EOF

cat > src/types/user.type.ts <<EOF
import { UserRole } from "../enums/user.enum";

export interface User {
  id: string;
  name: string;
  role: UserRole;
  createdAt: Date;
}
EOF

cat > src/types/index.ts <<EOF
export * from "./message.type";
export * from "./user.type";
EOF

# --- UTILS ---
cat > src/utils/format.ts <<EOF
export function formatDate(date: Date): string {
  return date.toISOString();
}
EOF

cat > src/utils/index.ts <<EOF
export * from "./format";
EOF

# --- MAIN ENTRY ---
cat > src/index.ts <<EOF
export * from "./enums";
export * from "./constants";
export * from "./types";
export * from "./utils";
EOF

# Install dev dependencies
echo "📦 Installing dependencies..."
npm install typescript tsup --save-dev

echo "✅ @vieltalk/core initialized successfully!"
echo "Next steps:"
echo "  cd vieltalk"
echo "  npm run build"

