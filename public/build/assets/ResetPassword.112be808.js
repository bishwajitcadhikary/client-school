import{a as y,r as $,bL as C,y as x,aw as T,d as e,av as d,w as s,V as P,k as a,aL as u,H as F,b as w,o as L,aS as R,bK as S,e as B,f as p,g as i,i as V,j as I,m as M}from"./app.c74c21f4.js";import{a as j,b as q,c as H,d as N}from"./auth-v1-tree.87718d64.js";import{V as U}from"./VForm.64f4569b.js";import{V as D}from"./VRow.51c37cbe.js";import{V as m}from"./VCol.fb68aa0d.js";import{V as f}from"./VTextField.2cf6dc35.js";import"./form.655e4f4e.js";/* empty css              */import"./VCounter.bd549793.js";import"./VLabel.2a4a1171.js";const E={class:"auth-wrapper d-flex align-center justify-center pa-4"},K={class:"d-flex"},z=["src"],A={class:"text-h5 font-weight-semibold mb-1"},ae={__name:"ResetPassword",props:{email:String,token:String},setup(g){const c=g,o=y({token:c.token,email:c.email,password:"",password_confirmation:""}),l=$(!1),b=C(),_=x(()=>b.global.name.value==="light"?j:q),h=()=>{o.post(route("password.update"),{onFinish:()=>o.reset("password","password_confirmation")})};return(t,r)=>{const k=w("Head"),v=w("Link");return L(),T(F,null,[e(k,{title:t.$t("Forgot Password")},null,8,["title"]),d("div",E,[e(P,{class:"auth-card pa-4 pt-7","max-width":"448"},{default:s(()=>[e(R,{class:"justify-center"},{prepend:s(()=>[d("div",K,[d("img",{src:a(S),class:"w-100"},null,8,z)])]),default:s(()=>[e(B,{class:"font-weight-semibold text-2xl text-uppercase"},{default:s(()=>[p(i(t.$page.props.app.name),1)]),_:1})]),_:1}),e(V,{class:"pt-2"},{default:s(()=>[d("h5",A,i(t.$t("Reset Password")),1)]),_:1}),e(V,null,{default:s(()=>[e(U,{onSubmit:I(h,["prevent"])},{default:s(()=>[e(D,null,{default:s(()=>[e(m,{cols:"12"},{default:s(()=>[e(f,{modelValue:a(o).email,"onUpdate:modelValue":r[0]||(r[0]=n=>a(o).email=n),label:t.$t("Email"),type:"email","error-messages":a(o).errors.email,required:"",disabled:""},null,8,["modelValue","label","error-messages"])]),_:1}),e(m,{cols:"12"},{default:s(()=>[e(f,{modelValue:a(o).password,"onUpdate:modelValue":r[1]||(r[1]=n=>a(o).password=n),label:t.$t("Password"),type:l.value?"text":"password","append-inner-icon":l.value?"mdi-eye-off-outline":"mdi-eye-outline","error-messages":a(o).errors.password,min:"8",required:"","onClick:appendInner":r[2]||(r[2]=n=>l.value=!l.value)},null,8,["modelValue","label","type","append-inner-icon","error-messages"])]),_:1}),e(m,{cols:"12"},{default:s(()=>[e(f,{modelValue:a(o).password_confirmation,"onUpdate:modelValue":r[3]||(r[3]=n=>a(o).password_confirmation=n),label:t.$t("Confirm Password"),type:l.value?"text":"password","append-inner-icon":l.value?"mdi-eye-off-outline":"mdi-eye-outline","error-messages":a(o).errors.password_confirmation,min:"8",required:"","onClick:appendInner":r[4]||(r[4]=n=>l.value=!l.value)},null,8,["modelValue","label","type","append-inner-icon","error-messages"])]),_:1}),e(m,{cols:"12"},{default:s(()=>[e(M,{loading:a(o).processing,type:"submit",block:""},{default:s(()=>[p(i(t.$t("Reset Password")),1)]),_:1},8,["loading"])]),_:1}),e(m,{cols:"12",class:"text-center text-base"},{default:s(()=>[d("span",null,i(t.$t("Remember your credentials?")),1),e(v,{class:"text-primary ms-2",href:t.route("login")},{default:s(()=>[p(i(t.$t("Login")),1)]),_:1},8,["href"])]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1}),e(u,{class:"auth-footer-start-tree d-none d-md-block",src:a(H),width:250},null,8,["src"]),e(u,{src:a(N),class:"auth-footer-end-tree d-none d-md-block",width:350},null,8,["src"]),e(u,{class:"auth-footer-mask d-none d-md-block",src:a(_)},null,8,["src"])])],64)}}};export{ae as default};
