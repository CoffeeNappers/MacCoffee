.class Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "GameIconButtonHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->lambda$updateNotificationsStateDelayed$1(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 0

    .prologue
    .line 73
    return-void
.end method
