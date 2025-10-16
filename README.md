# `@vieltalk/core`

> Shared core utilities, enums, types, constants, and error codes for VielTalk applications — backend, web, and mobile.

---

## **Table of Contents**

- [`@vieltalk/core`](#vieltalkcore)
  - [**Table of Contents**](#table-of-contents)
  - [**Overview**](#overview)
  - [**Features**](#features)
  - [**Installation**](#installation)
  - [**Folder Structure**](#folder-structure)
  - [**Usage**](#usage)
    - [**Enums**](#enums)
    - [**Error Codes**](#error-codes)
    - [**Types**](#types)
    - [**Constants**](#constants)
    - [**Utils**](#utils)
  - [**NestJS Exception Example**](#nestjs-exception-example)
  - [**Contributing**](#contributing)
  - [**License**](#license)

---

## **Overview**

`@vieltalk/core` is a centralized **shared library** for the VielTalk app. It contains:

* Standardized **enums** (message types, user roles, etc.)
* **Error codes** for backend/frontend consistency
* Shared **types** and **interfaces**
* Common **constants** (Redis keys, system events)
* Utility functions (formatting, helpers)

It ensures **single source of truth** across **backend, web, and mobile apps**.

---

## **Features**

* ✅ Consistent enums across all platforms
* ✅ Centralized error codes (`AppErrorCode`)
* ✅ Strongly-typed TypeScript interfaces
* ✅ Shared constants for Redis, system events, etc.
* ✅ Utility helpers for common tasks
* ✅ Ready for **NestJS**, React, React Native, or Node.js

---

## **Installation**

```bash
npm install @vieltalk/core
# or using yarn
yarn add @vieltalk/core
```

---

## **Folder Structure**

```
src/
├── enums/
│   ├── message.enum.ts
│   ├── user.enum.ts
│   └── index.ts
├── constants/
│   ├── redis-keys.ts
│   ├── system-events.ts
│   └── index.ts
├── types/
│   ├── message.type.ts
│   ├── user.type.ts
│   └── index.ts
├── utils/
│   ├── format.ts
│   └── index.ts
├── errors/
│   ├── app-error.ts
│   └── index.ts
└── index.ts
```

---

## **Usage**

### **Enums**

```ts
import { MessageType } from '@vieltalk/core/enums';

const type: MessageType = MessageType.TEXT;
```

### **Error Codes**

```ts
import { AppErrorCode } from '@vieltalk/core/errors';

throw new Error(AppErrorCode.DEVICE_ALREADY_REGISTERED);
```

### **Types**

```ts
import { Message } from '@vieltalk/core/types';

const newMessage: Message = {
  id: '123',
  type: 'TEXT',
  content: 'Hello!',
  senderId: 'user_1',
  createdAt: new Date(),
};
```

### **Constants**

```ts
import { REDIS_KEYS, SYSTEM_EVENTS } from '@vieltalk/core/constants';

const key = REDIS_KEYS.USER_SOCKET('user1', 'device1');
console.log(SYSTEM_EVENTS.CONTACT_SYNCED);
```

### **Utils**

```ts
import { formatDate } from '@vieltalk/core/utils';

console.log(formatDate(new Date())); // ISO string
```

---

## **NestJS Exception Example**

```ts
import { BadRequestException } from '@nestjs/common';
import { AppErrorCode } from '@vieltalk/core/errors';

throw new BadRequestException({
  message: 'Device is already registered.',
  code: AppErrorCode.DEVICE_ALREADY_REGISTERED,
});
```

This standardizes error handling across backend, web, and mobile.

---

## **Contributing**

1. Fork the repository
2. Create a branch (`feature/my-feature`)
3. Commit your changes
4. Open a pull request

---

## **License**

MIT © VielTalk
