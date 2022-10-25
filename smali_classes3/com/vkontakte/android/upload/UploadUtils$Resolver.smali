.class interface abstract Lcom/vkontakte/android/upload/UploadUtils$Resolver;
.super Ljava/lang/Object;
.source "UploadUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/upload/UploadUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "Resolver"
.end annotation


# virtual methods
.method public abstract resolveName(Landroid/net/Uri;)Ljava/lang/String;
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract resolvePath(Landroid/net/Uri;)Ljava/lang/String;
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method
