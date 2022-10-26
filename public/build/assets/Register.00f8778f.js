import{by as w,ay as B,bi as F,E as k,aB as G,ah as K,h as q,d as H,a as c,w as f,V as W,u as d,ai as I,o as z,ak as Q,b as v,bq as U,al as Y,f as S,t as y,ac as x,aD as J,aE as R,aW as X,K as Z,ar as O,r as ee}from"./app.769d2bc8.js";import te from"./AuthProvider.2e721819.js";import{a as ne,b as re,c as ae,d as ie}from"./auth-v1-tree.87718d64.js";import{V as oe}from"./VForm.02b40034.js";import{V as se}from"./VRow.0d9576a1.js";import{V as g}from"./VCol.4d479741.js";import{V as le}from"./VCheckbox.97600991.js";/* empty css              */import"./VCheckboxBtn.416dd0ae.js";var L={},$={},C={},V={},ue=w&&w.__awaiter||function(r,o,t,i){function a(e){return e instanceof t?e:new t(function(u){u(e)})}return new(t||(t=Promise))(function(e,u){function l(s){try{n(i.next(s))}catch(m){u(m)}}function h(s){try{n(i.throw(s))}catch(m){u(m)}}function n(s){s.done?e(s.value):a(s.value).then(l,h)}n((i=i.apply(r,o||[])).next())})},ce=w&&w.__generator||function(r,o){var t={label:0,sent:function(){if(e[0]&1)throw e[1];return e[1]},trys:[],ops:[]},i,a,e,u;return u={next:l(0),throw:l(1),return:l(2)},typeof Symbol=="function"&&(u[Symbol.iterator]=function(){return this}),u;function l(n){return function(s){return h([n,s])}}function h(n){if(i)throw new TypeError("Generator is already executing.");for(;t;)try{if(i=1,a&&(e=n[0]&2?a.return:n[0]?a.throw||((e=a.return)&&e.call(a),0):a.next)&&!(e=e.call(a,n[1])).done)return e;switch(a=0,e&&(n=[n[0]&2,e.value]),n[0]){case 0:case 1:e=n;break;case 4:return t.label++,{value:n[1],done:!1};case 5:t.label++,a=n[1],n=[0];continue;case 7:n=t.ops.pop(),t.trys.pop();continue;default:if(e=t.trys,!(e=e.length>0&&e[e.length-1])&&(n[0]===6||n[0]===2)){t=0;continue}if(n[0]===3&&(!e||n[1]>e[0]&&n[1]<e[3])){t.label=n[1];break}if(n[0]===6&&t.label<e[1]){t.label=e[1],e=n;break}if(e&&t.label<e[2]){t.label=e[2],t.ops.push(n);break}e[2]&&t.ops.pop(),t.trys.pop();continue}n=o.call(r,t)}catch(s){n=[6,s],a=0}finally{i=e=0}if(n[0]&5)throw n[1];return{value:n[0]?n[1]:void 0,done:!0}}};Object.defineProperty(V,"__esModule",{value:!0});V.ReCaptchaInstance=void 0;var de=function(){function r(o,t,i){this.siteKey=o,this.recaptchaID=t,this.recaptcha=i,this.styleContainer=null}return r.prototype.execute=function(o){return ue(this,void 0,void 0,function(){return ce(this,function(t){return[2,this.recaptcha.enterprise?this.recaptcha.enterprise.execute(this.recaptchaID,{action:o}):this.recaptcha.execute(this.recaptchaID,{action:o})]})})},r.prototype.getSiteKey=function(){return this.siteKey},r.prototype.hideBadge=function(){this.styleContainer===null&&(this.styleContainer=document.createElement("style"),this.styleContainer.innerHTML=".grecaptcha-badge{visibility:hidden !important;}",document.head.appendChild(this.styleContainer))},r.prototype.showBadge=function(){this.styleContainer!==null&&(document.head.removeChild(this.styleContainer),this.styleContainer=null)},r}();V.ReCaptchaInstance=de;Object.defineProperty(C,"__esModule",{value:!0});C.getInstance=C.load=void 0;var fe=V,b;(function(r){r[r.NOT_LOADED=0]="NOT_LOADED",r[r.LOADING=1]="LOADING",r[r.LOADED=2]="LOADED"})(b||(b={}));var A=function(){function r(){}return r.load=function(o,t){if(t===void 0&&(t={}),typeof document>"u")return Promise.reject(new Error("This is a library for the browser!"));if(r.getLoadingState()===b.LOADED)return r.instance.getSiteKey()===o?Promise.resolve(r.instance):Promise.reject(new Error("reCAPTCHA already loaded with different site key!"));if(r.getLoadingState()===b.LOADING)return o!==r.instanceSiteKey?Promise.reject(new Error("reCAPTCHA already loaded with different site key!")):new Promise(function(a,e){r.successfulLoadingConsumers.push(function(u){return a(u)}),r.errorLoadingRunnable.push(function(u){return e(u)})});r.instanceSiteKey=o,r.setLoadingState(b.LOADING);var i=new r;return new Promise(function(a,e){i.loadScript(o,t.useRecaptchaNet||!1,t.useEnterprise||!1,t.renderParameters?t.renderParameters:{},t.customUrl).then(function(){r.setLoadingState(b.LOADED);var u=i.doExplicitRender(grecaptcha,o,t.explicitRenderParameters?t.explicitRenderParameters:{},t.useEnterprise||!1),l=new fe.ReCaptchaInstance(o,u,grecaptcha);r.successfulLoadingConsumers.forEach(function(h){return h(l)}),r.successfulLoadingConsumers=[],t.autoHideBadge&&l.hideBadge(),r.instance=l,a(l)}).catch(function(u){r.errorLoadingRunnable.forEach(function(l){return l(u)}),r.errorLoadingRunnable=[],e(u)})})},r.getInstance=function(){return r.instance},r.setLoadingState=function(o){r.loadingState=o},r.getLoadingState=function(){return r.loadingState===null?b.NOT_LOADED:r.loadingState},r.prototype.loadScript=function(o,t,i,a,e){var u=this;t===void 0&&(t=!1),i===void 0&&(i=!1),a===void 0&&(a={}),e===void 0&&(e="");var l=document.createElement("script");l.setAttribute("recaptcha-v3-script","");var h="https://www.google.com/recaptcha/api.js";t&&(i?h="https://recaptcha.net/recaptcha/enterprise.js":h="https://recaptcha.net/recaptcha/api.js"),i&&(h="https://www.google.com/recaptcha/enterprise.js"),e&&(h=e),a.render&&(a.render=void 0);var n=this.buildQueryString(a);return l.src=h+"?render=explicit"+n,new Promise(function(s,m){l.addEventListener("load",u.waitForScriptToLoad(function(){s(l)},i),!1),l.onerror=function(p){r.setLoadingState(b.NOT_LOADED),m(p)},document.head.appendChild(l)})},r.prototype.buildQueryString=function(o){var t=Object.keys(o);return t.length<1?"":"&"+Object.keys(o).filter(function(i){return!!o[i]}).map(function(i){return i+"="+o[i]}).join("&")},r.prototype.waitForScriptToLoad=function(o,t){var i=this;return function(){window.grecaptcha===void 0?setTimeout(function(){i.waitForScriptToLoad(o,t)},r.SCRIPT_LOAD_DELAY):t?window.grecaptcha.enterprise.ready(function(){o()}):window.grecaptcha.ready(function(){o()})}},r.prototype.doExplicitRender=function(o,t,i,a){var e={sitekey:t,badge:i.badge,size:i.size,tabindex:i.tabindex};return i.container?a?o.enterprise.render(i.container,e):o.render(i.container,e):a?o.enterprise.render(e):o.render(e)},r.loadingState=null,r.instance=null,r.instanceSiteKey=null,r.successfulLoadingConsumers=[],r.errorLoadingRunnable=[],r.SCRIPT_LOAD_DELAY=25,r}();C.load=A.load;C.getInstance=A.getInstance;(function(r){Object.defineProperty(r,"__esModule",{value:!0}),r.ReCaptchaInstance=r.getInstance=r.load=void 0;var o=C;Object.defineProperty(r,"load",{enumerable:!0,get:function(){return o.load}}),Object.defineProperty(r,"getInstance",{enumerable:!0,get:function(){return o.getInstance}});var t=V;Object.defineProperty(r,"ReCaptchaInstance",{enumerable:!0,get:function(){return t.ReCaptchaInstance}})})($);var P=w&&w.__awaiter||function(r,o,t,i){function a(e){return e instanceof t?e:new t(function(u){u(e)})}return new(t||(t=Promise))(function(e,u){function l(s){try{n(i.next(s))}catch(m){u(m)}}function h(s){try{n(i.throw(s))}catch(m){u(m)}}function n(s){s.done?e(s.value):a(s.value).then(l,h)}n((i=i.apply(r,o||[])).next())})},E=w&&w.__generator||function(r,o){var t={label:0,sent:function(){if(e[0]&1)throw e[1];return e[1]},trys:[],ops:[]},i,a,e,u;return u={next:l(0),throw:l(1),return:l(2)},typeof Symbol=="function"&&(u[Symbol.iterator]=function(){return this}),u;function l(n){return function(s){return h([n,s])}}function h(n){if(i)throw new TypeError("Generator is already executing.");for(;t;)try{if(i=1,a&&(e=n[0]&2?a.return:n[0]?a.throw||((e=a.return)&&e.call(a),0):a.next)&&!(e=e.call(a,n[1])).done)return e;switch(a=0,e&&(n=[n[0]&2,e.value]),n[0]){case 0:case 1:e=n;break;case 4:return t.label++,{value:n[1],done:!1};case 5:t.label++,a=n[1],n=[0];continue;case 7:n=t.ops.pop(),t.trys.pop();continue;default:if(e=t.trys,!(e=e.length>0&&e[e.length-1])&&(n[0]===6||n[0]===2)){t=0;continue}if(n[0]===3&&(!e||n[1]>e[0]&&n[1]<e[3])){t.label=n[1];break}if(n[0]===6&&t.label<e[1]){t.label=e[1],e=n;break}if(e&&t.label<e[2]){t.label=e[2],t.ops.push(n);break}e[2]&&t.ops.pop(),t.trys.pop();continue}n=o.call(r,t)}catch(s){n=[6,s],a=0}finally{i=e=0}if(n[0]&5)throw n[1];return{value:n[0]?n[1]:void 0,done:!0}}};Object.defineProperty(L,"__esModule",{value:!0});var M=L.useReCaptcha=L.VueReCaptcha=void 0,he=$,D=B,N=Symbol("VueReCaptchaInjectKey"),_={loadedWaiters:[],error:null};L.VueReCaptcha={install:function(r,o){var t=D.ref(!1),i=D.ref(void 0);r.config.globalProperties.$recaptchaLoaded=T(t),me(o).then(function(a){t.value=!0,i.value=a,r.config.globalProperties.$recaptcha=j(i),r.config.globalProperties.$recaptchaInstance=i,_.loadedWaiters.forEach(function(e){return e.resolve(!0)})}).catch(function(a){_.error=a,_.loadedWaiters.forEach(function(e){return e.reject(a)})}),r.provide(N,{instance:i,isLoaded:t,executeRecaptcha:j(i),recaptchaLoaded:T(t)})}};function pe(){return D.inject(N)}M=L.useReCaptcha=pe;function me(r){return P(this,void 0,void 0,function(){return E(this,function(o){switch(o.label){case 0:return[4,he.load(r.siteKey,r.loaderOptions)];case 1:return[2,o.sent()]}})})}function T(r){return function(){return new Promise(function(o,t){if(_.error!==null)return t(_.error);if(r.value)return o(!0);_.loadedWaiters.push({resolve:o,reject:t})})}}function j(r){var o=this;return function(t){return P(o,void 0,void 0,function(){var i;return E(this,function(a){switch(a.label){case 0:return[4,(i=r.value)===null||i===void 0?void 0:i.execute(t)];case 1:return[2,a.sent()]}})})}}const ve={class:"auth-wrapper d-flex align-center justify-center pa-4"},ye={class:"d-flex"},ge=["innerHTML"],be={class:"text-h5 font-weight-semibold mb-1"},we={class:"mb-0"},_e={class:"d-flex align-center mt-1 mb-4"},Ce={class:"me-1"},Le={href:"javascript:void(0)",class:"text-primary"},Ve={class:"mx-4"},$e={__name:"Register",setup(r){const{executeRecaptcha:o,recaptchaLoaded:t}=M(),i=async()=>{await t(),a.token=await o("login")};F(()=>{i()}),k(()=>{});const a=G({name:"",email:"",password:"",password_confirmation:"",terms:!1,token:""}),e=K(),u=k(()=>e.global.name.value==="light"?ne:re),l=q(!1),h=()=>{a.post(route("register"),{preserveScroll:!0,preserveState:!0,onFinish:()=>a.reset("password","password_confirmation")})};return(n,s)=>{const m=ee("Link");return z(),H("div",ve,[c(W,{class:"auth-card pa-4 pt-7","max-width":"448"},{default:f(()=>[c(Q,{class:"justify-center"},{prepend:f(()=>[v("div",ye,[v("div",{innerHTML:d(U)},null,8,ge)])]),default:f(()=>[c(Y,{class:"font-weight-semibold text-2xl text-uppercase"},{default:f(()=>[S(y(n.$page.props.app.name),1)]),_:1})]),_:1}),c(x,{class:"pt-2"},{default:f(()=>[v("h5",be,y(n.$t("Adventure starts here")),1),v("p",we,y(n.$t("Make your app management easy and fun!")),1)]),_:1}),c(x,null,{default:f(()=>[c(oe,{onSubmit:J(h,["prevent"])},{default:f(()=>[c(se,null,{default:f(()=>[c(g,{cols:"12"},{default:f(()=>[c(R,{modelValue:d(a).name,"onUpdate:modelValue":s[0]||(s[0]=p=>d(a).name=p),label:n.$t("Name"),"error-message":d(a).errors.name,required:""},null,8,["modelValue","label","error-message"])]),_:1}),c(g,{cols:"12"},{default:f(()=>[c(R,{modelValue:d(a).email,"onUpdate:modelValue":s[1]||(s[1]=p=>d(a).email=p),label:n.$t("Email"),type:"email","error-messages":d(a).errors.email,required:""},null,8,["modelValue","label","error-messages"])]),_:1}),c(g,{cols:"12"},{default:f(()=>[c(R,{modelValue:d(a).password,"onUpdate:modelValue":s[2]||(s[2]=p=>d(a).password=p),label:n.$t("Password"),type:l.value?"text":"password","append-inner-icon":l.value?"mdi-eye-off-outline":"mdi-eye-outline","onClick:appendInner":s[3]||(s[3]=p=>l.value=!l.value),"error-messages":d(a).errors.password,min:"8",required:""},null,8,["modelValue","label","type","append-inner-icon","error-messages"])]),_:1}),c(g,{cols:"12"},{default:f(()=>[c(R,{modelValue:d(a).password_confirmation,"onUpdate:modelValue":s[4]||(s[4]=p=>d(a).password_confirmation=p),label:n.$t("Confirm Password"),type:l.value?"text":"password","append-inner-icon":l.value?"mdi-eye-off-outline":"mdi-eye-outline","onClick:appendInner":s[5]||(s[5]=p=>l.value=!l.value),"error-messages":d(a).errors.password_confirmation,min:"8",required:""},null,8,["modelValue","label","type","append-inner-icon","error-messages"]),v("div",_e,[c(le,{id:"terms",modelValue:d(a).terms,"onUpdate:modelValue":s[6]||(s[6]=p=>d(a).terms=p),inline:"","error-messages":d(a).errors.terms},null,8,["modelValue","error-messages"]),c(X,{for:"terms",style:{opacity:"1"}},{default:f(()=>[v("span",Ce,y(n.$t("I agree to")),1),v("a",Le,y(n.$t("privacy policy & terms")),1)]),_:1})])]),_:1}),c(g,{cols:"12"},{default:f(()=>[c(Z,{loading:d(a).processing,type:"submit",block:""},{default:f(()=>[S(y(n.$t("Sign up")),1)]),_:1},8,["loading"])]),_:1}),c(g,{cols:"12",class:"text-center text-base"},{default:f(()=>[v("span",null,y(n.$t("Already have an account?")),1),c(m,{class:"text-primary ms-2",href:n.route("login")},{default:f(()=>[S(y(n.$t("Sign in instead")),1)]),_:1},8,["href"])]),_:1}),c(g,{cols:"12",class:"d-flex align-center"},{default:f(()=>[c(O),v("span",Ve,y(n.$t("or")),1),c(O)]),_:1}),c(g,{cols:"12",class:"text-center"},{default:f(()=>[c(te)]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1}),c(I,{class:"auth-footer-start-tree d-none d-md-block",src:d(ae),width:250},null,8,["src"]),c(I,{src:d(ie),class:"auth-footer-end-tree d-none d-md-block",width:350},null,8,["src"]),c(I,{class:"auth-footer-mask d-none d-md-block",src:d(u)},null,8,["src"])])}}};export{$e as default};
