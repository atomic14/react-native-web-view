import React from 'react';
import {SafeAreaView, StatusBar, requireNativeComponent} from 'react-native';

const WebView = requireNativeComponent('ATMWebView');

const App = () => {
  function pageLoaded(event) {
    console.log(event.nativeEvent);
  }

  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView style={{flex: 1}}>
        <WebView
          uri="https://news.ycombinator.com"
          style={{flex: 1}}
          onLoaded={pageLoaded}
        />
      </SafeAreaView>
    </>
  );
};

export default App;
