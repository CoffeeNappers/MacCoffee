.class public Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "FilePickerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/utils/FilePickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    const-class v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 57
    return-void
.end method


# virtual methods
.method public setSizeLimit(J)Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;
    .locals 3
    .param p1, "sizeLimit"    # J

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "size_limit"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 61
    return-object p0
.end method
