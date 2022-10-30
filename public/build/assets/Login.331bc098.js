import{a as v,by as y,B as $,r as x,aa as C,d as e,w as a,V as S,k as t,av as u,o as f,aA as T,a9 as l,bx as B,i as V,g as n,j as L,l as b,c as N,f as c,m as P,n as F,ax as h,u as j,b as M}from"./app.bbada7ee.js";import R from"./AuthProvider.e44db658.js";import{a as q,b as D,c as I,d as U}from"./auth-v1-tree.87718d64.js";import{V as E}from"./VForm.a9a30d19.js";import{V as A}from"./VRow.3d8628ae.js";import{V as i}from"./VCol.0ac1e7d0.js";import{V as W}from"./VCheckbox.fcb3898f.js";/* empty css              */import"./VCheckboxBtn.f552187c.js";import"./VSelectionControl.082103a1.js";const z={class:"auth-wrapper d-flex align-center justify-center pa-4"},G={class:"d-flex"},H=["src"],J={class:"text-h5 font-weight-semibold mb-1"},K={class:"mb-0"},O={class:"d-flex align-center justify-space-between flex-wrap mt-1 mb-4"},Q={class:"mx-4"},ne={__name:"Login",props:{canResetPassword:Boolean,status:String},setup(g){const o=v({email:"",password:"",remember:!1}),w=y(),_=$(()=>w.global.name.value==="light"?q:D),m=x(!1),k=()=>{o.post(route("login"),{preserveScroll:!0,onSuccess:s=>{j().showNotification(s)},onFinish:()=>o.reset("password")})};return(s,r)=>{const p=M("Link");return f(),C("div",z,[e(S,{class:"auth-card pa-4 pt-7","max-width":"448"},{default:a(()=>[e(T,{class:"justify-center"},{prepend:a(()=>[l("div",G,[l("img",{src:t(B),class:"w-100"},null,8,H)])]),_:1}),e(V,{class:"pt-2"},{default:a(()=>[l("h5",J,n(s.$t("Welcome to :title!",{title:s.$page.props.app.name})),1),l("p",K,n(s.$t("Please sign-in to your account and start the adventure")),1)]),_:1}),e(V,null,{default:a(()=>[e(E,{onSubmit:L(k,["prevent"])},{default:a(()=>[e(A,null,{default:a(()=>[e(i,{cols:"12"},{default:a(()=>[e(b,{modelValue:t(o).email,"onUpdate:modelValue":r[0]||(r[0]=d=>t(o).email=d),label:s.$t("Email"),type:"email","error-messages":t(o).errors.email,required:""},null,8,["modelValue","label","error-messages"])]),_:1}),e(i,{cols:"12"},{default:a(()=>[e(b,{modelValue:t(o).password,"onUpdate:modelValue":r[1]||(r[1]=d=>t(o).password=d),label:s.$t("Password"),type:m.value?"text":"password","append-inner-icon":m.value?"mdi-eye-off-outline":"mdi-eye-outline","error-messages":t(o).errors.password,required:"","onClick:appendInner":r[2]||(r[2]=d=>m.value=!m.value)},null,8,["modelValue","label","type","append-inner-icon","error-messages"]),l("div",O,[e(W,{modelValue:t(o).remember,"onUpdate:modelValue":r[3]||(r[3]=d=>t(o).remember=d),label:s.$t("Remember me")},null,8,["modelValue","label"]),g.canResetPassword?(f(),N(p,{key:0,href:s.route("password.request"),class:"ms-2 mb-1"},{default:a(()=>[c(n(s.$t("Forgot Password?")),1)]),_:1},8,["href"])):P("",!0)]),e(F,{loading:t(o).processing,type:"submit",block:""},{default:a(()=>[c(n(s.$t("Login")),1)]),_:1},8,["loading"])]),_:1}),e(i,{cols:"12",class:"text-center text-base"},{default:a(()=>[l("span",null,n(s.$t("New on our platform?")),1),e(p,{class:"text-primary ms-2",href:s.route("register")},{default:a(()=>[c(n(s.$t("Create an account")),1)]),_:1},8,["href"])]),_:1}),e(i,{cols:"12",class:"d-flex align-center"},{default:a(()=>[e(h),l("span",Q,n(s.$t("or")),1),e(h)]),_:1}),e(i,{cols:"12",class:"text-center"},{default:a(()=>[e(R)]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1}),e(u,{class:"auth-footer-start-tree d-none d-md-block",src:t(I),width:250},null,8,["src"]),e(u,{src:t(U),class:"auth-footer-end-tree d-none d-md-block",width:350},null,8,["src"]),e(u,{class:"auth-footer-mask d-none d-md-block",src:t(_)},null,8,["src"])])}}};export{ne as default};
