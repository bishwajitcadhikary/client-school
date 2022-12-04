import{a as $,bL as C,y as L,r as S,aw as T,d as e,av as l,w as a,V as x,k as t,aL as u,H as B,b as f,o as V,aS as F,bK as N,i as b,g as n,j as P,c as j,f as p,l as M,m as R,aQ as g,u as q}from"./app.c74c21f4.js";import D from"./AuthProvider.7cc94e2b.js";import{a as H,b as I,c as U,d as E}from"./auth-v1-tree.87718d64.js";import{V as K}from"./VForm.64f4569b.js";import{V as Q}from"./VRow.51c37cbe.js";import{V as m}from"./VCol.fb68aa0d.js";import{V as h}from"./VTextField.2cf6dc35.js";import{V as W}from"./VCheckbox.62885493.js";import"./form.655e4f4e.js";/* empty css              */import"./VCounter.bd549793.js";import"./VLabel.2a4a1171.js";import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";const z={class:"auth-wrapper d-flex align-center justify-center pa-4"},A={class:"d-flex"},G=["src"],J={class:"text-h5 font-weight-semibold mb-1"},O={class:"mb-0"},X={class:"d-flex align-center justify-space-between flex-wrap mt-1 mb-4"},Y={class:"mx-4"},ce={__name:"Login",props:{canResetPassword:Boolean,status:String},setup(w){const o=$({email:"",password:"",remember:!1}),_=C(),k=L(()=>_.global.name.value==="light"?H:I),d=S(!1),v=()=>{o.post(route("login"),{preserveScroll:!0,onSuccess:s=>{q().showNotification(s)},onFinish:()=>o.reset("password")})};return(s,r)=>{const y=f("Head"),c=f("Link");return V(),T(B,null,[e(y,{title:s.$t("Login")},null,8,["title"]),l("div",z,[e(x,{class:"auth-card pa-4 pt-7","max-width":"448"},{default:a(()=>[e(F,{class:"justify-center"},{prepend:a(()=>[l("div",A,[l("img",{src:t(N),class:"w-100"},null,8,G)])]),_:1}),e(b,{class:"pt-2"},{default:a(()=>[l("h5",J,n(s.$t("Welcome to :title!",{title:s.$page.props.app.name})),1),l("p",O,n(s.$t("Please sign-in to your account and start the adventure")),1)]),_:1}),e(b,null,{default:a(()=>[e(K,{onSubmit:P(v,["prevent"])},{default:a(()=>[e(Q,null,{default:a(()=>[e(m,{cols:"12"},{default:a(()=>[e(h,{modelValue:t(o).email,"onUpdate:modelValue":r[0]||(r[0]=i=>t(o).email=i),label:s.$t("Email"),type:"email","error-messages":t(o).errors.email,required:""},null,8,["modelValue","label","error-messages"])]),_:1}),e(m,{cols:"12"},{default:a(()=>[e(h,{modelValue:t(o).password,"onUpdate:modelValue":r[1]||(r[1]=i=>t(o).password=i),label:s.$t("Password"),type:d.value?"text":"password","append-inner-icon":d.value?"mdi-eye-off-outline":"mdi-eye-outline","error-messages":t(o).errors.password,required:"","onClick:appendInner":r[2]||(r[2]=i=>d.value=!d.value)},null,8,["modelValue","label","type","append-inner-icon","error-messages"]),l("div",X,[e(W,{modelValue:t(o).remember,"onUpdate:modelValue":r[3]||(r[3]=i=>t(o).remember=i),label:s.$t("Remember me")},null,8,["modelValue","label"]),w.canResetPassword?(V(),j(c,{key:0,href:s.route("password.request"),class:"ms-2 mb-1"},{default:a(()=>[p(n(s.$t("Forgot Password?")),1)]),_:1},8,["href"])):M("",!0)]),e(R,{loading:t(o).processing,type:"submit",block:""},{default:a(()=>[p(n(s.$t("Login")),1)]),_:1},8,["loading"])]),_:1}),e(m,{cols:"12",class:"text-center text-base"},{default:a(()=>[l("span",null,n(s.$t("New on our platform?")),1),e(c,{class:"text-primary ms-2",href:s.route("register")},{default:a(()=>[p(n(s.$t("Create an account")),1)]),_:1},8,["href"])]),_:1}),e(m,{cols:"12",class:"d-flex align-center"},{default:a(()=>[e(g),l("span",Y,n(s.$t("or")),1),e(g)]),_:1}),e(m,{cols:"12",class:"text-center"},{default:a(()=>[e(D)]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1}),e(u,{class:"auth-footer-start-tree d-none d-md-block",src:t(U),width:250},null,8,["src"]),e(u,{src:t(E),class:"auth-footer-end-tree d-none d-md-block",width:350},null,8,["src"]),e(u,{class:"auth-footer-mask d-none d-md-block",src:t(k)},null,8,["src"])])],64)}}};export{ce as default};
