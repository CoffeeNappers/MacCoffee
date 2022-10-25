.class final Lcom/vkontakte/android/utils/ApiMethodsHelper$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ApiMethodsHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/utils/ApiMethodsHelper;->lambda$clearHistory$0(ILandroid/content/Context;Lcom/vkontakte/android/functions/VoidF2;Ljava/lang/Object;Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$f:Lcom/vkontakte/android/functions/VoidF2;

.field final synthetic val$object:Ljava/lang/Object;

.field final synthetic val$uid:I


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/functions/VoidF2;ILjava/lang/Object;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    iput-object p2, p0, Lcom/vkontakte/android/utils/ApiMethodsHelper$1;->val$f:Lcom/vkontakte/android/functions/VoidF2;

    iput p3, p0, Lcom/vkontakte/android/utils/ApiMethodsHelper$1;->val$uid:I

    iput-object p4, p0, Lcom/vkontakte/android/utils/ApiMethodsHelper$1;->val$object:Ljava/lang/Object;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vkontakte/android/utils/ApiMethodsHelper$1;->val$f:Lcom/vkontakte/android/functions/VoidF2;

    iget v1, p0, Lcom/vkontakte/android/utils/ApiMethodsHelper$1;->val$uid:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/utils/ApiMethodsHelper$1;->val$object:Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/functions/VoidF2;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    return-void
.end method
