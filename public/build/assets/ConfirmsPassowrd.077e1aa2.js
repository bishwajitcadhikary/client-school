import{r as m,bv as C,aw as y,av as w,bz as b,d as s,w as a,aO as v,H as k,o as x,V as S,e as T,f as l,g as n,h as P,i as h,bE as B,aT as K,aU as _,m as V,bD as D,K as F}from"./app.ff209ba5.js";import{V as N}from"./VTextField.7da22a41.js";import"./VCounter.feafebbb.js";import"./form.96b9598d.js";const I={__name:"ConfirmsPassowrd",props:{title:{type:String,default:"Confirm Password"},content:{type:String,default:"For your security, please confirm your password to continue."},button:{type:String,default:"Confirm"}},emits:["confirmed"],setup(d,{emit:f}){const r=m(!1),e=C({password:"",error:"",processing:!1}),i=m(null),g=()=>{axios.get(route("password.confirmation")).then(o=>{o.data.confirmed?f("confirmed"):(r.value=!0,setTimeout(()=>i.value.focus(),250))})},p=()=>{e.processing=!0,axios.post(route("password.confirm"),{password:e.password}).then(()=>{e.processing=!1,u(),F().then(()=>f("confirmed"))}).catch(o=>{e.processing=!1,e.error=o.response.data.errors.password[0],i.value.focus()})},u=()=>{r.value=!1,e.password="",e.error=""};return(o,t)=>(x(),y(k,null,[w("span",null,[w("span",{onClick:g},[b(o.$slots,"default")])]),s(v,{modelValue:r.value,"onUpdate:modelValue":t[1]||(t[1]=c=>r.value=c),onClose:u},{default:a(()=>[s(S,null,{default:a(()=>[s(T,{class:"text-h5"},{default:a(()=>[l(n(d.title),1)]),_:1}),s(P,null,{default:a(()=>[l(n(d.content),1)]),_:1}),s(h,null,{default:a(()=>[s(N,{ref_key:"passwordInput",ref:i,modelValue:e.password,"onUpdate:modelValue":t[0]||(t[0]=c=>e.password=c),type:"password",class:"mt-1 block w-3/4",label:o.$t("Password"),"error-messages":e.error,onKeyup:B(p,["enter"])},null,8,["modelValue","label","error-messages","onKeyup"])]),_:1}),s(K,null,{default:a(()=>[s(_),s(V,{onClick:u},{default:a(()=>[l(n(o.$t("Cancel")),1)]),_:1}),s(V,{class:D(["ml-3",{"opacity-25":e.processing}]),disabled:e.processing,onClick:p},{default:a(()=>[l(n(d.button),1)]),_:1},8,["class","disabled"])]),_:1})]),_:1})]),_:1},8,["modelValue"])],64))}};export{I as default};