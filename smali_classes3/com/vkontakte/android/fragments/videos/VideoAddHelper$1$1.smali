.class Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$1;
.super Ljava/lang/Object;
.source "VideoAddHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->success(Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo$Result;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$1;->this$1:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 0
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I
    .param p3, "b"    # Z

    .prologue
    .line 72
    return-void
.end method
