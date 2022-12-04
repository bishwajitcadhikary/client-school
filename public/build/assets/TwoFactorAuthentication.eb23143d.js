import{r as h,a as L,y as M,_ as q,c as p,w as o,bM as E,o as e,d as n,i as N,k as u,aw as a,av as l,g as i,f as d,l as r,bB as P,H as Q,ax as Y,m as y,bA as x,V as D,aK as F}from"./app.c74c21f4.js";import _ from"./ConfirmsPassowrd.3a8dabf4.js";import{V as I}from"./VCol.fb68aa0d.js";import{V as z}from"./VTextField.2cf6dc35.js";import"./VCounter.bd549793.js";import"./VLabel.2a4a1171.js";import"./form.655e4f4e.js";/* empty css              */const G={key:0,class:"font-weight-semibold"},O={key:1,class:"font-weight-semibold"},U={key:2,class:"font-weight-semibold"},W=l("div",{class:"mt-3"},[l("p",null," When two factor authentication is enabled, you will be prompted for a secure, random token during authentication. You may retrieve this token from your phone's Google Authenticator application. ")],-1),j={key:3},J={key:0},X={class:"mt-4 max-w-xl text-sm text-gray-600"},Z={key:0,class:"font-semibold"},ee={key:1},te=["innerHTML"],oe={key:0,class:"mt-4 max-w-xl text-sm text-gray-600"},ae={class:"font-semibold"},se=["innerHTML"],ne={key:1,class:"mt-4"},re={key:1},le=l("div",{class:"mt-4 max-w-xl text-sm text-gray-600"},[l("p",{class:"font-semibold"}," Store these recovery codes in a secure password manager. They can be used to recover access to your account if your two factor authentication device is lost. ")],-1),ie={class:"grid gap-1 max-w-xl mt-4 px-4 py-4 font-mono text-sm bg-gray-100 rounded-lg"},ce={class:"mt-5"},ue={key:0},de={key:1},ge={__name:"TwoFactorAuthentication",props:{requiresConfirmation:Boolean},setup($){const B=$,c=h(!1),s=h(!1),m=h(!1),b=h(null),k=h(null),w=h([]),f=L({code:""}),v=M(()=>{var t,g;return!c.value&&((g=(t=E().props.value.auth)==null?void 0:t.user)==null?void 0:g.two_factor_enabled)});q(v,()=>{v.value||(f.reset(),f.clearErrors())});const K=()=>{c.value=!0,F.Inertia.post("/user/two-factor-authentication",{},{preserveScroll:!0,onSuccess:t=>Promise.all([A(),R(),T()]),onFinish:()=>{c.value=!1,s.value=B.requiresConfirmation}})},A=()=>axios.get("/user/two-factor-qr-code").then(t=>{b.value=t.data.svg}),R=()=>axios.get("/user/two-factor-secret-key").then(t=>{k.value=t.data.secretKey}),T=()=>axios.get("/user/two-factor-recovery-codes").then(t=>{w.value=t.data}),V=()=>{f.post("/user/confirmed-two-factor-authentication",{errorBag:"confirmTwoFactorAuthentication",preserveScroll:!0,preserveState:!0,onSuccess:()=>{s.value=!1,b.value=null,k.value=null}})},H=()=>{axios.post("/user/two-factor-recovery-codes").then(()=>T())},S=()=>{m.value=!0,F.Inertia.delete("/user/two-factor-authentication",{preserveScroll:!0,onSuccess:()=>{m.value=!1,s.value=!1}})};return(t,g)=>(e(),p(I,{cols:"12"},{default:o(()=>[n(D,{title:t.$t("Two-steps verification")},{default:o(()=>[n(N,null,{default:o(()=>[u(v)&&!s.value?(e(),a("p",G," You have enabled two factor authentication. ")):u(v)&&s.value?(e(),a("p",O," Finish enabling two factor authentication. ")):(e(),a("p",U," You have not enabled two factor authentication. ")),W,u(v)?(e(),a("div",j,[b.value?(e(),a("div",J,[l("div",X,[s.value?(e(),a("p",Z,i(t.$t("To finish enabling two factor authentication, scan the following QR code using your phone's authenticator application or enter the setup key and provide the generated OTP code.")),1)):(e(),a("p",ee,i(t.$t("Two factor authentication is now enabled. Scan the following QR code using your phone's authenticator application or enter the setup key.")),1))]),l("div",{class:"mt-4",innerHTML:b.value},null,8,te),k.value?(e(),a("div",oe,[l("p",ae,[d(" Setup Key: "),l("span",{innerHTML:k.value},null,8,se)])])):r("",!0),s.value?(e(),a("div",ne,[n(z,{modelValue:u(f).code,"onUpdate:modelValue":g[0]||(g[0]=C=>u(f).code=C),type:"text",name:"code",class:"block mt-1 w-1/2",inputmode:"numeric",autofocus:"",autocomplete:"one-time-code","error-messages":u(f).errors.code,onKeyup:P(V,["enter"])},null,8,["modelValue","error-messages","onKeyup"])])):r("",!0)])):r("",!0),w.value.length>0&&!s.value?(e(),a("div",re,[le,l("div",ie,[(e(!0),a(Q,null,Y(w.value,C=>(e(),a("div",{key:C},i(C),1))),128))])])):r("",!0)])):r("",!0),l("div",ce,[u(v)?(e(),a("div",de,[n(_,{onConfirmed:V},{default:o(()=>[s.value?(e(),p(y,{key:0,type:"button",class:x(["mr-3",{"opacity-25":c.value}]),disabled:c.value},{default:o(()=>[d(i(t.$t("Confirm")),1)]),_:1},8,["class","disabled"])):r("",!0)]),_:1}),n(_,{onConfirmed:H},{default:o(()=>[w.value.length>0&&!s.value?(e(),p(y,{key:0,color:"secondary",class:"mr-3"},{default:o(()=>[d(i(t.$t("Regenerate Recovery Codes")),1)]),_:1})):r("",!0)]),_:1}),n(_,{onConfirmed:T},{default:o(()=>[w.value.length===0&&!s.value?(e(),p(y,{key:0,color:"secondary",class:"mr-3"},{default:o(()=>[d(" Show Recovery Codes ")]),_:1})):r("",!0)]),_:1}),n(_,{onConfirmed:S},{default:o(()=>[s.value?(e(),p(y,{key:0,color:"secondary",class:x({"opacity-25":m.value}),disabled:m.value},{default:o(()=>[d(i(t.$t("Cancel")),1)]),_:1},8,["class","disabled"])):r("",!0)]),_:1}),n(_,{onConfirmed:S},{default:o(()=>[s.value?r("",!0):(e(),p(y,{key:0,color:"error",class:x({"opacity-25":m.value}),disabled:m.value},{default:o(()=>[d(i(t.$t("Disable")),1)]),_:1},8,["class","disabled"]))]),_:1})])):(e(),a("div",ue,[n(_,{onConfirmed:K},{default:o(()=>[n(y,{type:"button",class:x({"opacity-25":c.value}),disabled:c.value},{default:o(()=>[d(i(t.$t("Enable")),1)]),_:1},8,["class","disabled"])]),_:1})]))])]),_:1})]),_:1},8,["title"])]),_:1}))}};export{ge as default};
