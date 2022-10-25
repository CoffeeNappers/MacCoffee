.class Lcom/vkontakte/android/fragments/SettingsDomainFragment$DelayedLoader;
.super Ljava/lang/Object;
.source "SettingsDomainFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SettingsDomainFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DelayedLoader"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)V
    .locals 0

    .prologue
    .line 252
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$DelayedLoader;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/SettingsDomainFragment;Lcom/vkontakte/android/fragments/SettingsDomainFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/SettingsDomainFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/SettingsDomainFragment$1;

    .prologue
    .line 252
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment$DelayedLoader;-><init>(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 256
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$DelayedLoader;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$202(Lcom/vkontakte/android/fragments/SettingsDomainFragment;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 257
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$DelayedLoader;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$1000(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)V

    .line 258
    return-void
.end method
