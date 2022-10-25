.class Lcom/vkontakte/android/fragments/WebViewFragment$2$2;
.super Ljava/lang/Object;
.source "WebViewFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/WebViewFragment$2;->onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/WebViewFragment$2;

.field final synthetic val$callback:Landroid/webkit/GeolocationPermissions$Callback;

.field final synthetic val$origin:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/WebViewFragment$2;Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/WebViewFragment$2;

    .prologue
    .line 210
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2$2;->this$1:Lcom/vkontakte/android/fragments/WebViewFragment$2;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2$2;->val$callback:Landroid/webkit/GeolocationPermissions$Callback;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2$2;->val$origin:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    const/4 v2, 0x0

    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2$2;->val$callback:Landroid/webkit/GeolocationPermissions$Callback;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2$2;->val$origin:Ljava/lang/String;

    invoke-interface {v0, v1, v2, v2}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    .line 214
    return-void
.end method
