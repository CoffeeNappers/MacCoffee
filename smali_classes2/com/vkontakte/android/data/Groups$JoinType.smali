.class public final enum Lcom/vkontakte/android/data/Groups$JoinType;
.super Ljava/lang/Enum;
.source "Groups.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/Groups;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "JoinType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/data/Groups$JoinType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/data/Groups$JoinType;

.field public static final enum ACCEPT:Lcom/vkontakte/android/data/Groups$JoinType;

.field public static final enum DECLINE:Lcom/vkontakte/android/data/Groups$JoinType;

.field public static final enum UNSURE:Lcom/vkontakte/android/data/Groups$JoinType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 177
    new-instance v0, Lcom/vkontakte/android/data/Groups$JoinType;

    const-string/jumbo v1, "ACCEPT"

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/data/Groups$JoinType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/data/Groups$JoinType;->ACCEPT:Lcom/vkontakte/android/data/Groups$JoinType;

    .line 178
    new-instance v0, Lcom/vkontakte/android/data/Groups$JoinType;

    const-string/jumbo v1, "UNSURE"

    invoke-direct {v0, v1, v3}, Lcom/vkontakte/android/data/Groups$JoinType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/data/Groups$JoinType;->UNSURE:Lcom/vkontakte/android/data/Groups$JoinType;

    .line 179
    new-instance v0, Lcom/vkontakte/android/data/Groups$JoinType;

    const-string/jumbo v1, "DECLINE"

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/data/Groups$JoinType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/data/Groups$JoinType;->DECLINE:Lcom/vkontakte/android/data/Groups$JoinType;

    .line 176
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/vkontakte/android/data/Groups$JoinType;

    sget-object v1, Lcom/vkontakte/android/data/Groups$JoinType;->ACCEPT:Lcom/vkontakte/android/data/Groups$JoinType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vkontakte/android/data/Groups$JoinType;->UNSURE:Lcom/vkontakte/android/data/Groups$JoinType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vkontakte/android/data/Groups$JoinType;->DECLINE:Lcom/vkontakte/android/data/Groups$JoinType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/vkontakte/android/data/Groups$JoinType;->$VALUES:[Lcom/vkontakte/android/data/Groups$JoinType;

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
    .line 176
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/data/Groups$JoinType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 176
    const-class v0, Lcom/vkontakte/android/data/Groups$JoinType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/Groups$JoinType;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/data/Groups$JoinType;
    .locals 1

    .prologue
    .line 176
    sget-object v0, Lcom/vkontakte/android/data/Groups$JoinType;->$VALUES:[Lcom/vkontakte/android/data/Groups$JoinType;

    invoke-virtual {v0}, [Lcom/vkontakte/android/data/Groups$JoinType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/data/Groups$JoinType;

    return-object v0
.end method
