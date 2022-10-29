import{r as h,a as E,B as L,aT as N,c as p,w as o,bN as q,o as e,d as n,i as H,k as u,av as a,au as l,g as i,f as d,m as r,l as P,bM as Q,M as Y,aw as D,n as y,bg as x,V as I,aE as F}from"./app.75fe97d5.js";import _ from"./ConfirmsPassowrd.a0631b64.js";import{V as z}from"./VCol.73001860.js";/* empty css              */const G={key:0,class:"font-weight-semibold"},O={key:1,class:"font-weight-semibold"},U={key:2,class:"font-weight-semibold"},W=l("div",{class:"mt-3"},[l("p",null," When two factor authentication is enabled, you will be prompted for a secure, random token during authentication. You may retrieve this token from your phone's Google Authenticator application. ")],-1),j={key:3},J={key:0},X={class:"mt-4 max-w-xl text-sm text-gray-600"},Z={key:0,class:"font-semibold"},ee={key:1},te=["innerHTML"],oe={key:0,class:"mt-4 max-w-xl text-sm text-gray-600"},ae={class:"font-semibold"},se=["innerHTML"],ne={key:1,class:"mt-4"},re={key:1},le=l("div",{class:"mt-4 max-w-xl text-sm text-gray-600"},[l("p",{class:"font-semibold"}," Store these recovery codes in a secure password manager. They can be used to recover access to your account if your two factor authentication device is lost. ")],-1),ie={class:"grid gap-1 max-w-xl mt-4 px-4 py-4 font-mono text-sm bg-gray-100 rounded-lg"},ce={class:"mt-5"},ue={key:0},de={key:1},pe={__name:"TwoFactorAuthentication",props:{requiresConfirmation:Boolean},setup($){const B=$,c=h(!1),s=h(!1),f=h(!1),b=h(null),k=h(null),w=h([]),m=E({code:""}),v=L(()=>{var t,g;return!c.value&&((g=(t=q().props.value.auth)==null?void 0:t.user)==null?void 0:g.two_factor_enabled)});N(v,()=>{v.value||(m.reset(),m.clearErrors())});const K=()=>{c.value=!0,F.Inertia.post("/user/two-factor-authentication",{},{preserveScroll:!0,onSuccess:t=>Promise.all([R(),A(),T()]),onFinish:()=>{c.value=!1,s.value=B.requiresConfirmation}})},R=()=>axios.get("/user/two-factor-qr-code").then(t=>{b.value=t.data.svg}),A=()=>axios.get("/user/two-factor-secret-key").then(t=>{k.value=t.data.secretKey}),T=()=>axios.get("/user/two-factor-recovery-codes").then(t=>{w.value=t.data}),V=()=>{m.post("/user/confirmed-two-factor-authentication",{errorBag:"confirmTwoFactorAuthentication",preserveScroll:!0,preserveState:!0,onSuccess:()=>{s.value=!1,b.value=null,k.value=null}})},M=()=>{axios.post("/user/two-factor-recovery-codes").then(()=>T())},S=()=>{f.value=!0,F.Inertia.delete("/user/two-factor-authentication",{preserveScroll:!0,onSuccess:()=>{f.value=!1,s.value=!1}})};return(t,g)=>(e(),p(z,{cols:"12"},{default:o(()=>[n(I,{title:t.$t("Two-steps verification")},{default:o(()=>[n(H,null,{default:o(()=>[u(v)&&!s.value?(e(),a("p",G," You have enabled two factor authentication. ")):u(v)&&s.value?(e(),a("p",O," Finish enabling two factor authentication. ")):(e(),a("p",U," You have not enabled two factor authentication. ")),W,u(v)?(e(),a("div",j,[b.value?(e(),a("div",J,[l("div",X,[s.value?(e(),a("p",Z,i(t.$t("To finish enabling two factor authentication, scan the following QR code using your phone's authenticator application or enter the setup key and provide the generated OTP code.")),1)):(e(),a("p",ee,i(t.$t("Two factor authentication is now enabled. Scan the following QR code using your phone's authenticator application or enter the setup key.")),1))]),l("div",{class:"mt-4",innerHTML:b.value},null,8,te),k.value?(e(),a("div",oe,[l("p",ae,[d(" Setup Key: "),l("span",{innerHTML:k.value},null,8,se)])])):r("",!0),s.value?(e(),a("div",ne,[n(P,{modelValue:u(m).code,"onUpdate:modelValue":g[0]||(g[0]=C=>u(m).code=C),type:"text",name:"code",class:"block mt-1 w-1/2",inputmode:"numeric",autofocus:"",autocomplete:"one-time-code","error-messages":u(m).errors.code,onKeyup:Q(V,["enter"])},null,8,["modelValue","error-messages","onKeyup"])])):r("",!0)])):r("",!0),w.value.length>0&&!s.value?(e(),a("div",re,[le,l("div",ie,[(e(!0),a(Y,null,D(w.value,C=>(e(),a("div",{key:C},i(C),1))),128))])])):r("",!0)])):r("",!0),l("div",ce,[u(v)?(e(),a("div",de,[n(_,{onConfirmed:V},{default:o(()=>[s.value?(e(),p(y,{key:0,type:"button",class:x(["mr-3",{"opacity-25":c.value}]),disabled:c.value},{default:o(()=>[d(i(t.$t("Confirm")),1)]),_:1},8,["class","disabled"])):r("",!0)]),_:1}),n(_,{onConfirmed:M},{default:o(()=>[w.value.length>0&&!s.value?(e(),p(y,{key:0,color:"secondary",class:"mr-3"},{default:o(()=>[d(i(t.$t("Regenerate Recovery Codes")),1)]),_:1})):r("",!0)]),_:1}),n(_,{onConfirmed:T},{default:o(()=>[w.value.length===0&&!s.value?(e(),p(y,{key:0,color:"secondary",class:"mr-3"},{default:o(()=>[d(" Show Recovery Codes ")]),_:1})):r("",!0)]),_:1}),n(_,{onConfirmed:S},{default:o(()=>[s.value?(e(),p(y,{key:0,color:"secondary",class:x({"opacity-25":f.value}),disabled:f.value},{default:o(()=>[d(i(t.$t("Cancel")),1)]),_:1},8,["class","disabled"])):r("",!0)]),_:1}),n(_,{onConfirmed:S},{default:o(()=>[s.value?r("",!0):(e(),p(y,{key:0,color:"error",class:x({"opacity-25":f.value}),disabled:f.value},{default:o(()=>[d(i(t.$t("Disable")),1)]),_:1},8,["class","disabled"]))]),_:1})])):(e(),a("div",ue,[n(_,{onConfirmed:K},{default:o(()=>[n(y,{type:"button",class:x({"opacity-25":c.value}),disabled:c.value},{default:o(()=>[d(i(t.$t("Enable")),1)]),_:1},8,["class","disabled"])]),_:1})]))])]),_:1})]),_:1},8,["title"])]),_:1}))}};export{pe as default};
