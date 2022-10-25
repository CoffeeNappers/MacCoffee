.class interface abstract Lcom/vkontakte/android/SendActivity$IntentHandler;
.super Ljava/lang/Object;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/SendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "IntentHandler"
.end annotation


# virtual methods
.method public abstract handle()Z
.end method

.method public abstract onGotPhotoAlbum(Lcom/vkontakte/android/api/PhotoAlbum;)V
    .param p1    # Lcom/vkontakte/android/api/PhotoAlbum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onGotRecipient(Lcom/vkontakte/android/UserProfile;)V
    .param p1    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
