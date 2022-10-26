import{a as k,bd as y,A as v,au as T,b as e,at as r,w as t,V as x,i as a,aW as d,L as F,r as c,o as p,a_ as C,bH as L,d as $,e as n,t as o,g as f,c as B,aw as M,h as P,j as S,k as H}from"./app.dc2d0110.js";import{a as N,b as R,c as j,d as E}from"./auth-v1-tree.87718d64.js";import{V as A}from"./VAlert.895307e1.js";import{V as D}from"./VForm.25e51c80.js";import{V as I}from"./VRow.12f67658.js";import{V as u}from"./VCol.e64a4a91.js";/* empty css              */const q={class:"auth-wrapper d-flex align-center justify-center pa-4"},J={class:"d-flex"},U=["innerHTML"],W={class:"text-h5 font-weight-semibold mb-1"},z={class:"mb-0"},ee={__name:"ForgotPassword",props:{canResetPassword:Boolean,status:String},setup(i){const l=k({email:""}),h=y(),_=v(()=>h.global.name.value==="light"?N:R),V=()=>{l.post(route("password.email"),{preserveState:!0,preserveScroll:!0})};return(s,m)=>{const g=c("Head"),w=c("Link");return p(),T(F,null,[e(g,{title:s.$t("Forgot Password")},null,8,["title"]),r("div",q,[e(x,{class:"auth-card pa-4 pt-7","max-width":"448"},{default:t(()=>[e(C,{class:"justify-center"},{prepend:t(()=>[r("div",J,[r("div",{innerHTML:a(L)},null,8,U)])]),default:t(()=>[e($,{class:"font-weight-semibold text-2xl text-uppercase"},{default:t(()=>[n(o(s.$page.props.app.name),1)]),_:1})]),_:1}),e(f,{class:"pt-2"},{default:t(()=>[r("h5",W,o(s.$t("Forgot Password")),1),r("p",z,o(s.$t("Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.")),1),i.status?(p(),B(A,{key:0,dense:"",text:"",type:"success",class:"mt-3"},{default:t(()=>[n(o(i.status),1)]),_:1})):M("",!0)]),_:1}),e(f,null,{default:t(()=>[e(D,{onSubmit:P(V,["prevent"])},{default:t(()=>[e(I,null,{default:t(()=>[e(u,{cols:"12"},{default:t(()=>[e(S,{modelValue:a(l).email,"onUpdate:modelValue":m[0]||(m[0]=b=>a(l).email=b),label:s.$t("Email"),type:"email","error-messages":a(l).errors.email,required:""},null,8,["modelValue","label","error-messages"])]),_:1}),e(u,{cols:"12"},{default:t(()=>[e(H,{loading:a(l).processing,type:"submit",block:""},{default:t(()=>[n(o(s.$t("Email Password Reset Link")),1)]),_:1},8,["loading"])]),_:1}),e(u,{cols:"12",class:"text-center text-base"},{default:t(()=>[r("span",null,o(s.$t("Remember your credentials?")),1),e(w,{class:"text-primary ms-2",href:s.route("login")},{default:t(()=>[n(o(s.$t("Login")),1)]),_:1},8,["href"])]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1}),e(d,{class:"auth-footer-start-tree d-none d-md-block",src:a(j),width:250},null,8,["src"]),e(d,{src:a(E),class:"auth-footer-end-tree d-none d-md-block",width:350},null,8,["src"]),e(d,{class:"auth-footer-mask d-none d-md-block",src:a(_)},null,8,["src"])])],64)}}};export{ee as default};
