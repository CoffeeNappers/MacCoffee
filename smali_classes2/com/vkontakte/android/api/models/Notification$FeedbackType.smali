.class public final enum Lcom/vkontakte/android/api/models/Notification$FeedbackType;
.super Ljava/lang/Enum;
.source "Notification.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/models/Notification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FeedbackType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/api/models/Notification$FeedbackType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/api/models/Notification$FeedbackType;

.field public static final enum Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

.field public static final enum Copy:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

.field public static final enum Group:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

.field public static final enum Header:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

.field public static final enum MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

.field public static final enum None:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

.field public static final enum Post:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

.field public static final enum Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 202
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    const-string/jumbo v1, "Users"

    invoke-direct {v0, v1, v3}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    .line 203
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    const-string/jumbo v1, "Post"

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Post:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    .line 204
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    const-string/jumbo v1, "Comment"

    invoke-direct {v0, v1, v5}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    .line 205
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    const-string/jumbo v1, "Copy"

    invoke-direct {v0, v1, v6}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Copy:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    .line 206
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    const-string/jumbo v1, "None"

    invoke-direct {v0, v1, v7}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->None:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    .line 207
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    const-string/jumbo v1, "Group"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Group:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    .line 208
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    const-string/jumbo v1, "Header"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Header:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    .line 209
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    const-string/jumbo v1, "MoneyTransfer"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    .line 201
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Post:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Copy:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->None:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Group:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Header:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->$VALUES:[Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 201
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/api/models/Notification$FeedbackType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 201
    const-class v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/api/models/Notification$FeedbackType;
    .locals 1

    .prologue
    .line 201
    sget-object v0, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->$VALUES:[Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    invoke-virtual {v0}, [Lcom/vkontakte/android/api/models/Notification$FeedbackType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    return-object v0
.end method
