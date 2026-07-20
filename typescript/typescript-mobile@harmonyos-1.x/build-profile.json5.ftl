{
  "app": {
    "signingConfigs": [],
    "products": [
      {
        "name": "${app.name}",
        "signingConfig": "default",
        "targetSdkVersion": "6.0.1(21)",
        "compatibleSdkVersion": "6.0.1(21)",
        "runtimeOS": "HarmonyOS",
        "buildOption": {
          "strictMode": {
            "caseSensitiveCheck": true,
            "useNormalizedOHMUrl": true
          }
        }
      }
    ],
    "buildModeSet": [
      {
        "name": "debug",
      },
      {
        "name": "release"
      }
    ]
  },
  "modules": [
    {
      "name": "${app.name}",
      "srcPath": "./entry",
      "targets": [
        {
          "name": "${app.name}",
          "applyToProducts": [
            "${app.name}"
          ]
        }
      ]
    },
    {
      "name": "sdk",
      "srcPath": "./sdk",
      "targets": [
        {
          "name": "${app.name}",
          "applyToProducts": [
            "${app.name}"
          ]
        }
      ]
    }
  ]
}