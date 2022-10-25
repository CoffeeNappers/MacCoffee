.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10$1;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;->success(Lcom/vkontakte/android/data/VKList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;

.field final synthetic val$audios:Lcom/vkontakte/android/data/VKList;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;Lcom/vkontakte/android/data/VKList;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;

    .prologue
    .line 343
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10$1;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10$1;->val$audios:Lcom/vkontakte/android/data/VKList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 346
    if-nez p2, :cond_0

    .line 347
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10$1;->val$audios:Lcom/vkontakte/android/data/VKList;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/AudioFacade;->startDownloadTracks(Ljava/util/Collection;Z)V

    .line 349
    :cond_0
    return-void
.end method
