.class public final enum Lio/sentry/event/Breadcrumb$Type;
.super Ljava/lang/Enum;
.source "Breadcrumb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/sentry/event/Breadcrumb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/sentry/event/Breadcrumb$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/sentry/event/Breadcrumb$Type;

.field public static final enum DEFAULT:Lio/sentry/event/Breadcrumb$Type;

.field public static final enum HTTP:Lio/sentry/event/Breadcrumb$Type;

.field public static final enum NAVIGATION:Lio/sentry/event/Breadcrumb$Type;

.field public static final enum USER:Lio/sentry/event/Breadcrumb$Type;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 90
    new-instance v0, Lio/sentry/event/Breadcrumb$Type;

    const-string/jumbo v1, "DEFAULT"

    const-string/jumbo v2, "default"

    invoke-direct {v0, v1, v3, v2}, Lio/sentry/event/Breadcrumb$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/sentry/event/Breadcrumb$Type;->DEFAULT:Lio/sentry/event/Breadcrumb$Type;

    .line 95
    new-instance v0, Lio/sentry/event/Breadcrumb$Type;

    const-string/jumbo v1, "HTTP"

    const-string/jumbo v2, "http"

    invoke-direct {v0, v1, v4, v2}, Lio/sentry/event/Breadcrumb$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/sentry/event/Breadcrumb$Type;->HTTP:Lio/sentry/event/Breadcrumb$Type;

    .line 100
    new-instance v0, Lio/sentry/event/Breadcrumb$Type;

    const-string/jumbo v1, "NAVIGATION"

    const-string/jumbo v2, "navigation"

    invoke-direct {v0, v1, v5, v2}, Lio/sentry/event/Breadcrumb$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/sentry/event/Breadcrumb$Type;->NAVIGATION:Lio/sentry/event/Breadcrumb$Type;

    .line 105
    new-instance v0, Lio/sentry/event/Breadcrumb$Type;

    const-string/jumbo v1, "USER"

    const-string/jumbo v2, "user"

    invoke-direct {v0, v1, v6, v2}, Lio/sentry/event/Breadcrumb$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/sentry/event/Breadcrumb$Type;->USER:Lio/sentry/event/Breadcrumb$Type;

    .line 86
    const/4 v0, 0x4

    new-array v0, v0, [Lio/sentry/event/Breadcrumb$Type;

    sget-object v1, Lio/sentry/event/Breadcrumb$Type;->DEFAULT:Lio/sentry/event/Breadcrumb$Type;

    aput-object v1, v0, v3

    sget-object v1, Lio/sentry/event/Breadcrumb$Type;->HTTP:Lio/sentry/event/Breadcrumb$Type;

    aput-object v1, v0, v4

    sget-object v1, Lio/sentry/event/Breadcrumb$Type;->NAVIGATION:Lio/sentry/event/Breadcrumb$Type;

    aput-object v1, v0, v5

    sget-object v1, Lio/sentry/event/Breadcrumb$Type;->USER:Lio/sentry/event/Breadcrumb$Type;

    aput-object v1, v0, v6

    sput-object v0, Lio/sentry/event/Breadcrumb$Type;->$VALUES:[Lio/sentry/event/Breadcrumb$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 115
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 116
    iput-object p3, p0, Lio/sentry/event/Breadcrumb$Type;->value:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/sentry/event/Breadcrumb$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 86
    const-class v0, Lio/sentry/event/Breadcrumb$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/sentry/event/Breadcrumb$Type;

    return-object v0
.end method

.method public static values()[Lio/sentry/event/Breadcrumb$Type;
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lio/sentry/event/Breadcrumb$Type;->$VALUES:[Lio/sentry/event/Breadcrumb$Type;

    invoke-virtual {v0}, [Lio/sentry/event/Breadcrumb$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/sentry/event/Breadcrumb$Type;

    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lio/sentry/event/Breadcrumb$Type;->value:Ljava/lang/String;

    return-object v0
.end method
