pod-template
============

## important notice 重要提示
It's based on official template https://github.com/CocoaPods/pod-template.git however, delete the choice for macOS,swift, test framework options, just keep the custom class prefix function, it will only ask you which prefix you want to use, and will create an iOS pod lib project with demo, no test frameworks.
基于官方模板改造，删除了选择mac os平台和Swift的选项，以及测试框架的选项，只保留了自定义类前缀的功能，会默认创建一个OC语言的iOS的pod库，带demo工程，无测试框架。

## usage 使用方法
pod lib create yourPodName --template-url=https://github.com/iPermanent/podNewTemplate.git 

## one more thing 另一个注意事项
It add the HRCocoaTools pod lib just for test, can be remove yourself, however I think you can find some goodthing in it or usefull for you, you can change this repo yourself to add your own private lib by default.
添加了HRCocoaTools做为测试项，可自行移除，也可基于此模板修改为默认集成你自己的私有pod库

An opinionated template for creating a Pod with the following features:

- Git as the source control management system
- Clean folder structure
- Project generation
- MIT license
- Testing as a standard
- Turnkey access to Travis CI
- Also supports Carthage

## Getting started

There are two reasons for wanting to work on this template, making your own or improving the one for everyone's. In both cases you will want to work with the ruby classes inside the `setup` folder, and the example base template that it works on from inside `template/ios/`. 

## Best practices

The command `pod lib create` aims to be ran along with this guide: https://guides.cocoapods.org/making/using-pod-lib-create.html so any changes of flow should be updated there also.

It is open to communal input, but adding new features, or new ideas are probably better off being discussed in an issue first. In general we try to think if an average Xcode user is going to use this feature or not, if it's unlikely is it a _very strongly_ encouraged best practice ( ala testing / CI. ) If it's something useful for saving a few minutes every deploy, or isn't easily documented in the guide it is likely to be denied in order to keep this project as simple as possible.

## Requirements:

- CocoaPods 1.0.0+

