import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import removeAttr from 'remove-attr'

export default defineConfig({
  plugins: [
    vue(),
    process.env.NODE_ENV === 'production' && removeAttr({
      attributes: ['data-test']
    })
  ].filter(Boolean),
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})