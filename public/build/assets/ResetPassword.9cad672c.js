import{ax as k,H as T,l as $,m as x,i as C,b as e,h as d,w as s,u as a,q as m,F as P,r as w,o as F,bf as L,p,t as i,ay as M,az as f,g as R}from"./app.886b2409.js";import{a as H,b as S,c as q,d as B}from"./auth-v1-tree.87718d64.js";import{a as I,b as N,c as U,V}from"./VCard.1fa31838.js";import{V as j}from"./VForm.d0c83518.js";import{V as D}from"./VRow.c02f22eb.js";import{V as u}from"./VCol.1c30f3c9.js";const E={class:"auth-wrapper d-flex align-center justify-center pa-4"},z={class:"d-flex"},A=["innerHTML"],G={class:"text-h5 font-weight-semibold mb-1"},Y={__name:"ResetPassword",props:{email:String,token:String},setup(g){const c=g,o=k({token:c.token,email:c.email,password:"",password_confirmation:""}),l=T(!1),b=$(),_=x(()=>b.global.name.value==="light"?H:S),h=()=>{o.post(route("password.update"),{onFinish:()=>o.reset("password","password_confirmation")})};return(t,r)=>{const v=w("Head"),y=w("Link");return F(),C(P,null,[e(v,{title:t.$t("Forgot Password")},null,8,["title"]),d("div",E,[e(I,{class:"auth-card pa-4 pt-7","max-width":"448"},{default:s(()=>[e(N,{class:"justify-center"},{prepend:s(()=>[d("div",z,[d("div",{innerHTML:a(L)},null,8,A)])]),default:s(()=>[e(U,{class:"font-weight-semibold text-2xl text-uppercase"},{default:s(()=>[p(i(t.$page.props.app.name),1)]),_:1})]),_:1}),e(V,{class:"pt-2"},{default:s(()=>[d("h5",G,i(t.$t("Reset Password")),1)]),_:1}),e(V,null,{default:s(()=>[e(j,{onSubmit:M(h,["prevent"])},{default:s(()=>[e(D,null,{default:s(()=>[e(u,{cols:"12"},{default:s(()=>[e(f,{modelValue:a(o).email,"onUpdate:modelValue":r[0]||(r[0]=n=>a(o).email=n),label:t.$t("Email"),type:"email","error-messages":a(o).errors.email,required:"",disabled:""},null,8,["modelValue","label","error-messages"])]),_:1}),e(u,{cols:"12"},{default:s(()=>[e(f,{modelValue:a(o).password,"onUpdate:modelValue":r[1]||(r[1]=n=>a(o).password=n),label:t.$t("Password"),type:l.value?"text":"password","append-inner-icon":l.value?"mdi-eye-off-outline":"mdi-eye-outline","onClick:appendInner":r[2]||(r[2]=n=>l.value=!l.value),"error-messages":a(o).errors.password,min:"8",required:""},null,8,["modelValue","label","type","append-inner-icon","error-messages"])]),_:1}),e(u,{cols:"12"},{default:s(()=>[e(f,{modelValue:a(o).password_confirmation,"onUpdate:modelValue":r[3]||(r[3]=n=>a(o).password_confirmation=n),label:t.$t("Confirm Password"),type:l.value?"text":"password","append-inner-icon":l.value?"mdi-eye-off-outline":"mdi-eye-outline","onClick:appendInner":r[4]||(r[4]=n=>l.value=!l.value),"error-messages":a(o).errors.password_confirmation,min:"8",required:""},null,8,["modelValue","label","type","append-inner-icon","error-messages"])]),_:1}),e(u,{cols:"12"},{default:s(()=>[e(R,{loading:a(o).processing,type:"submit",block:""},{default:s(()=>[p(i(t.$t("Reset Password")),1)]),_:1},8,["loading"])]),_:1}),e(u,{cols:"12",class:"text-center text-base"},{default:s(()=>[d("span",null,i(t.$t("Remember your credentials?")),1),e(y,{class:"text-primary ms-2",href:t.route("login")},{default:s(()=>[p(i(t.$t("Login")),1)]),_:1},8,["href"])]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1}),e(m,{class:"auth-footer-start-tree d-none d-md-block",src:a(q),width:250},null,8,["src"]),e(m,{src:a(B),class:"auth-footer-end-tree d-none d-md-block",width:350},null,8,["src"]),e(m,{class:"auth-footer-mask d-none d-md-block",src:a(_)},null,8,["src"])])],64)}}};export{Y as default};