{
  "name": "${app.name}",
  "version": "1.0.0",
  "main": "dist/index.cjs",
  "module": "dist/index.js",
  "types": "dist/index.d.ts",
  "scripts": {
    "build": "tsup",
    "test": "vitest"
  },
  "devDependencies": {
    "tsup": "^7.2.0",
    "typescript": "^5.3.0",
    "vitest": "^1.0.0"
  }
}