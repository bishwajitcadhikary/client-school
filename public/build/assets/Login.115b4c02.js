import{ax as k,l as y,m as $,H as x,i as C,b as e,w as s,u as t,q as p,o as f,h as n,bf as T,p as u,t as l,ay as L,az as V,a as B,e as M,g as P,B as b,r as F}from"./app.21a975b2.js";import N from"./AuthProvider.894f3752.js";import{a as S,b as q,c as R,d as j}from"./auth-v1-tree.87718d64.js";import{a as D,b as H,c as I,V as h}from"./VCard.81ba3810.js";import{V as U}from"./VForm.d67dcacf.js";import{V as E}from"./VRow.95dd16bf.js";import{V as i}from"./VCol.69e39502.js";import{V as z}from"./VCheckbox.92acc77c.js";import"./VCheckboxBtn.ad4c2d67.js";import"./VSelectionControl.31b751d2.js";const W={class:"auth-wrapper d-flex align-center justify-center pa-4"},A={class:"d-flex"},G=["innerHTML"],J={class:"text-h5 font-weight-semibold mb-1"},K={class:"mb-0"},O={class:"d-flex align-center justify-space-between flex-wrap mt-1 mb-4"},Q={class:"mx-4"},ne={__name:"Login",props:{canResetPassword:Boolean,status:String},setup(g){const o=k({email:"",password:"",remember:!1}),w=y(),_=$(()=>w.global.name.value==="light"?S:q),m=x(!1),v=()=>{o.post(route("login"),{preserveScroll:!0,onFinish:()=>o.reset("password")})};return(a,r)=>{const c=F("Link");return f(),C("div",W,[e(D,{class:"auth-card pa-4 pt-7","max-width":"448"},{default:s(()=>[e(H,{class:"justify-center"},{prepend:s(()=>[n("div",A,[n("div",{innerHTML:t(T)},null,8,G)])]),default:s(()=>[e(I,{class:"font-weight-semibold text-2xl text-uppercase"},{default:s(()=>[u(l(a.$page.props.app.name),1)]),_:1})]),_:1}),e(h,{class:"pt-2"},{default:s(()=>[n("h5",J,l(a.$t("Welcome to :title!",{title:a.$page.props.app.name})),1),n("p",K,l(a.$t("Please sign-in to your account and start the adventure")),1)]),_:1}),e(h,null,{default:s(()=>[e(U,{onSubmit:L(v,["prevent"])},{default:s(()=>[e(E,null,{default:s(()=>[e(i,{cols:"12"},{default:s(()=>[e(V,{modelValue:t(o).email,"onUpdate:modelValue":r[0]||(r[0]=d=>t(o).email=d),label:a.$t("Email"),type:"email","error-messages":t(o).errors.email,required:""},null,8,["modelValue","label","error-messages"])]),_:1}),e(i,{cols:"12"},{default:s(()=>[e(V,{modelValue:t(o).password,"onUpdate:modelValue":r[1]||(r[1]=d=>t(o).password=d),label:a.$t("Password"),type:m.value?"text":"password","append-inner-icon":m.value?"mdi-eye-off-outline":"mdi-eye-outline","error-messages":t(o).errors.password,"onClick:appendInner":r[2]||(r[2]=d=>m.value=!m.value),required:""},null,8,["modelValue","label","type","append-inner-icon","error-messages"]),n("div",O,[e(z,{modelValue:t(o).remember,"onUpdate:modelValue":r[3]||(r[3]=d=>t(o).remember=d),label:a.$t("Remember me")},null,8,["modelValue","label"]),g.canResetPassword?(f(),B(c,{key:0,href:a.route("password.request"),class:"ms-2 mb-1"},{default:s(()=>[u(l(a.$t("Forgot Password?")),1)]),_:1},8,["href"])):M("",!0)]),e(P,{loading:t(o).processing,type:"submit",block:""},{default:s(()=>[u(l(a.$t("Login")),1)]),_:1},8,["loading"])]),_:1}),e(i,{cols:"12",class:"text-center text-base"},{default:s(()=>[n("span",null,l(a.$t("New on our platform?")),1),e(c,{class:"text-primary ms-2",href:a.route("register")},{default:s(()=>[u(l(a.$t("Create an account")),1)]),_:1},8,["href"])]),_:1}),e(i,{cols:"12",class:"d-flex align-center"},{default:s(()=>[e(b),n("span",Q,l(a.$t("or")),1),e(b)]),_:1}),e(i,{cols:"12",class:"text-center"},{default:s(()=>[e(N)]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1}),e(p,{class:"auth-footer-start-tree d-none d-md-block",src:t(R),width:250},null,8,["src"]),e(p,{src:t(j),class:"auth-footer-end-tree d-none d-md-block",width:350},null,8,["src"]),e(p,{class:"auth-footer-mask d-none d-md-block",src:t(_)},null,8,["src"])])}}};export{ne as default};
