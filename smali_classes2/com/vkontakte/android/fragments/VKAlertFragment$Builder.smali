.class public Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
.super Ljava/lang/Object;
.source "VKAlertFragment.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/VKAlertFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;",
            ">;"
        }
    .end annotation
.end field

.field static final TAG:Ljava/lang/String; = "Builder"


# instance fields
.field iconId:I

.field message:Ljava/lang/String;

.field positiveButtonTitleId:Ljava/lang/String;

.field titleId:Ljava/lang/String;

.field url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 135
    new-instance v0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder$1;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->iconId:I

    .line 75
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->titleId:Ljava/lang/String;

    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->message:Ljava/lang/String;

    .line 77
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->positiveButtonTitleId:Ljava/lang/String;

    .line 78
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->url:Ljava/lang/String;

    .line 79
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 123
    const/4 v0, 0x0

    return v0
.end method

.method public setIcon(I)Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
    .locals 0
    .param p1, "iconId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 82
    iput p1, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->iconId:I

    .line 83
    return-object p0
.end method

.method public setMessage(Ljava/lang/String;)Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->message:Ljava/lang/String;

    .line 93
    return-object p0
.end method

.method public setPositiveButtonTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
    .locals 0
    .param p1, "titleId"    # Ljava/lang/String;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->positiveButtonTitleId:Ljava/lang/String;

    .line 98
    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
    .locals 0
    .param p1, "titleId"    # Ljava/lang/String;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->titleId:Ljava/lang/String;

    .line 88
    return-object p0
.end method

.method public setUrl(Ljava/lang/String;)Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->url:Ljava/lang/String;

    .line 103
    return-object p0
.end method

.method public show(Landroid/content/Context;Ljava/lang/Class;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 107
    .local p2, "classFragment":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->show(Landroid/content/Context;Ljava/lang/Class;I)V

    .line 108
    return-void
.end method

.method public show(Landroid/content/Context;Ljava/lang/Class;I)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "animResId"    # I
        .annotation build Landroid/support/annotation/StyleRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 111
    .local p2, "classFragment":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 112
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v1, "Builder"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 113
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    new-instance v2, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    const-class v3, Lcom/vkontakte/android/FragmentDialogActivity;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>(Ljava/lang/Class;)V

    const/high16 v3, 0x439c0000    # 312.0f

    .line 114
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    const/high16 v3, 0x42000000    # 32.0f

    .line 115
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    const/16 v3, 0x11

    .line 116
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    const v3, 0x7f0203db

    .line 117
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    .line 118
    invoke-virtual {v2, p3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowAnimationResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    invoke-direct {v1, p2, v2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 119
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 128
    iget v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->iconId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 129
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->titleId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->message:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->positiveButtonTitleId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 133
    return-void
.end method
