import{m as d,V as l}from"./VSelectionControl.e7494f68.js";import{M as m,N as f,q as k,B as I,y as t,s as x,d as b,D as h,ak as V}from"./app.c74c21f4.js";const C=m({indeterminate:Boolean,indeterminateIcon:{type:f,default:"$checkboxIndeterminate"},...d({falseIcon:"$checkboxOff",trueIcon:"$checkboxOn"})}),p=k({name:"VCheckboxBtn",props:C(),emits:{"update:modelValue":e=>!0,"update:indeterminate":e=>!0},setup(e,a){let{slots:o,emit:c}=a;const n=I(e,"indeterminate");function i(u){n.value&&(n.value=!1),c("update:modelValue",u)}const r=t(()=>e.indeterminate?e.indeterminateIcon:e.falseIcon),s=t(()=>e.indeterminate?e.indeterminateIcon:e.trueIcon);return x(()=>b(l,h(e,{class:"v-checkbox-btn",type:"checkbox",inline:!0,"onUpdate:modelValue":i,falseIcon:r.value,trueIcon:s.value,"aria-checked":e.indeterminate?"mixed":void 0}),o)),{}}});function y(e){return V(e,Object.keys(p.props))}export{p as V,y as f,C as m};
