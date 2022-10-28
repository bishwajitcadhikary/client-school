<template>
  <VLayout style="z-index: 0">
    <VAppBar color="grey-lighten-2" />
    <VNavigationDrawer
      color="grey-darken-2"
      permanent
    />
    <VNavigationDrawer
      color="grey-darken-2"
      permanent
      location="right"
    />
    <VMain>
      <Link href="/login">
        login
      </Link>
    </VMain>
  </VLayout>
</template>
