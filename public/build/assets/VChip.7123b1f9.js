import{j as A,ad as w,ae as H,q as P,s as B,v as _,A as x,af as M,B as N,G as k,H as O,a as l,S as Q,I as g,m as X,k as Y,l as Z,ag as J,n as K,Y as U,p as W,Z as ee,_ as ae,$ as le,a1 as te,a5 as se,ah as ne,x as ie,ai as ue,a6 as de,a7 as y,a8 as oe,ab as ce,Q as d,aj as re,ak as o,al as ve,R as S}from"./app.dfca5287.js";const G=Symbol.for("vuetify:v-chip-group");A({name:"VChipGroup",props:{column:Boolean,filter:Boolean,valueComparator:{type:Function,default:w},...H({selectedClass:"v-chip--selected"}),...P(),...B(),..._({variant:"tonal"})},emits:{"update:modelValue":e=>!0},setup(e,c){let{slots:s}=c;const{themeClasses:r}=x(e),{isSelected:t,select:v,next:f,prev:p,selected:m}=M(e,G);return N({VChip:{color:k(e,"color"),filter:k(e,"filter"),variant:k(e,"variant")}}),O(()=>{var n;return l(e.tag,{class:["v-chip-group",{"v-chip-group--column":e.column},r.value]},{default:()=>[(n=s.default)==null?void 0:n.call(s,{isSelected:t,select:v,next:f,prev:p,selected:m.value})]})}),{}}});const pe=A({name:"VChip",directives:{Ripple:Q},props:{activeClass:String,appendAvatar:String,appendIcon:g,closable:Boolean,closeIcon:{type:g,default:"$delete"},closeLabel:{type:String,default:"$vuetify.close"},draggable:Boolean,filter:Boolean,filterIcon:{type:String,default:"$complete"},label:Boolean,link:Boolean,pill:Boolean,prependAvatar:String,prependIcon:g,ripple:{type:Boolean,default:!0},text:String,modelValue:{type:Boolean,default:!0},...X(),...Y(),...Z(),...J(),...K(),...U(),...W(),...P({tag:"span"}),...B(),..._({variant:"tonal"})},emits:{"click:close":e=>!0,"update:active":e=>!0,"update:modelValue":e=>!0,"group:selected":e=>!0},setup(e,c){let{attrs:s,emit:r,slots:t}=c;const{borderClasses:v}=ee(e),{colorClasses:f,colorStyles:p,variantClasses:m}=ae(e),{densityClasses:n}=le(e),{elevationClasses:R}=te(e),{roundedClasses:$}=se(e),{sizeClasses:D}=ne(e),{themeClasses:T}=x(e),C=ie(e,"modelValue"),a=ue(e,G,!1),h=de(e,s);function z(i){C.value=!1,r("click:close",i)}return()=>{var i;const E=h.isLink.value?"a":e.tag,F=!!(t.append||e.appendIcon||e.appendAvatar),L=!!(t.close||e.closable),V=!!(t.filter||e.filter)&&a,j=!!(t.prepend||e.prependIcon||e.prependAvatar),b=!a||a.isSelected.value,u=!e.disabled&&(!!a||h.isClickable.value||e.link),q=e.link?e.link:a==null?void 0:a.toggle;return C.value&&y(l(E,{class:["v-chip",{"v-chip--disabled":e.disabled,"v-chip--label":e.label,"v-chip--link":u,"v-chip--filter":V,"v-chip--pill":e.pill},T.value,v.value,b?f.value:void 0,n.value,R.value,$.value,D.value,m.value,a==null?void 0:a.selectedClass.value],style:[b?p.value:void 0],disabled:e.disabled||void 0,draggable:e.draggable,href:h.href.value,onClick:u&&q},{default:()=>{var I;return[ce(u,"v-chip"),V&&l(d,{key:"filter",defaults:{VIcon:{icon:e.filterIcon}}},{default:()=>[l(re,null,{default:()=>[y(l("div",{class:"v-chip__filter"},[t.filter?t.filter():l(o,null,null)]),[[ve,a.isSelected.value]])]})]}),j&&l(d,{key:"prepend",defaults:{VAvatar:{image:e.prependAvatar},VIcon:{icon:e.prependIcon}}},{default:()=>[t.prepend?l("div",{class:"v-chip__prepend"},[t.prepend()]):e.prependAvatar?l(S,{start:!0},null):e.prependIcon?l(o,{start:!0},null):void 0]}),(I=(i=t.default)==null?void 0:i.call(t,{isSelected:a==null?void 0:a.isSelected.value,selectedClass:a==null?void 0:a.selectedClass.value,select:a==null?void 0:a.select,toggle:a==null?void 0:a.toggle,value:a==null?void 0:a.value.value,disabled:e.disabled}))!=null?I:e.text,F&&l(d,{key:"append",defaults:{VAvatar:{image:e.appendAvatar},VIcon:{icon:e.appendIcon}}},{default:()=>[t.append?l("div",{class:"v-chip__append"},[t.append()]):e.appendAvatar?l(S,{end:!0},null):e.appendIcon?l(o,{end:!0},null):void 0]}),L&&l(d,{key:"close",defaults:{VIcon:{icon:e.closeIcon,size:"x-small"}}},{default:()=>[l("div",{class:"v-chip__close",onClick:z},[t.close?t.close():l(o,null,null)])]})]}}),[[oe("ripple"),u&&e.ripple,null]])}}});export{pe as V};
