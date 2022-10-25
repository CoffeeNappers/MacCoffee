.class public Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "BoardTopicViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field private static COMMENTS_COUNT:Ljava/lang/String;

.field private static SHOW_LAST_COMMENT:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 111
    const-string/jumbo v0, "show_last_comment"

    sput-object v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->SHOW_LAST_COMMENT:Ljava/lang/String;

    .line 112
    const-string/jumbo v0, "comments_count"

    sput-object v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->COMMENTS_COUNT:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "groupId"    # I
    .param p3, "title"    # Ljava/lang/String;

    .prologue
    .line 115
    const-class v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "group_id"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    sget-object v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->COMMENTS_COUNT:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    sget-object v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->SHOW_LAST_COMMENT:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public setIsAdmin(Z)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;
    .locals 2
    .param p1, "isAdmin"    # Z

    .prologue
    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "is_admin"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 133
    return-object p0
.end method

.method public setIsClosed(Z)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;
    .locals 2
    .param p1, "isClosed"    # Z

    .prologue
    .line 127
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "is_closed"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 128
    return-object p0
.end method

.method public setOffset(I)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;
    .locals 2
    .param p1, "offset"    # I

    .prologue
    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "offset"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 123
    return-object p0
.end method

.method public showLast(ZI)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;
    .locals 2
    .param p1, "b"    # Z
    .param p2, "commentsCount"    # I

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->args:Landroid/os/Bundle;

    sget-object v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->SHOW_LAST_COMMENT:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->args:Landroid/os/Bundle;

    sget-object v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->COMMENTS_COUNT:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 139
    return-object p0
.end method
