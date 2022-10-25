.class public Lcom/vk/webapp/VKUIWebContainerFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "VKUIWebContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/webapp/VKUIWebContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field private static final KEY_URL:Ljava/lang/String; = "key_url"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 66
    const-class v0, Lcom/vk/webapp/VKUIWebContainerFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 67
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "key_url"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "disable_drawer_layout"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 69
    return-void
.end method
