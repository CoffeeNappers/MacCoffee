.class public final enum Lio/sentry/event/Breadcrumb$Level;
.super Ljava/lang/Enum;
.source "Breadcrumb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/sentry/event/Breadcrumb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Level"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/sentry/event/Breadcrumb$Level;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/sentry/event/Breadcrumb$Level;

.field public static final enum CRITICAL:Lio/sentry/event/Breadcrumb$Level;

.field public static final enum DEBUG:Lio/sentry/event/Breadcrumb$Level;

.field public static final enum ERROR:Lio/sentry/event/Breadcrumb$Level;

.field public static final enum INFO:Lio/sentry/event/Breadcrumb$Level;

.field public static final enum WARNING:Lio/sentry/event/Breadcrumb$Level;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 46
    new-instance v0, Lio/sentry/event/Breadcrumb$Level;

    const-string/jumbo v1, "DEBUG"

    const-string/jumbo v2, "debug"

    invoke-direct {v0, v1, v3, v2}, Lio/sentry/event/Breadcrumb$Level;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/sentry/event/Breadcrumb$Level;->DEBUG:Lio/sentry/event/Breadcrumb$Level;

    .line 51
    new-instance v0, Lio/sentry/event/Breadcrumb$Level;

    const-string/jumbo v1, "INFO"

    const-string/jumbo v2, "info"

    invoke-direct {v0, v1, v4, v2}, Lio/sentry/event/Breadcrumb$Level;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/sentry/event/Breadcrumb$Level;->INFO:Lio/sentry/event/Breadcrumb$Level;

    .line 56
    new-instance v0, Lio/sentry/event/Breadcrumb$Level;

    const-string/jumbo v1, "WARNING"

    const-string/jumbo v2, "warning"

    invoke-direct {v0, v1, v5, v2}, Lio/sentry/event/Breadcrumb$Level;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/sentry/event/Breadcrumb$Level;->WARNING:Lio/sentry/event/Breadcrumb$Level;

    .line 61
    new-instance v0, Lio/sentry/event/Breadcrumb$Level;

    const-string/jumbo v1, "ERROR"

    const-string/jumbo v2, "error"

    invoke-direct {v0, v1, v6, v2}, Lio/sentry/event/Breadcrumb$Level;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/sentry/event/Breadcrumb$Level;->ERROR:Lio/sentry/event/Breadcrumb$Level;

    .line 66
    new-instance v0, Lio/sentry/event/Breadcrumb$Level;

    const-string/jumbo v1, "CRITICAL"

    const-string/jumbo v2, "critical"

    invoke-direct {v0, v1, v7, v2}, Lio/sentry/event/Breadcrumb$Level;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/sentry/event/Breadcrumb$Level;->CRITICAL:Lio/sentry/event/Breadcrumb$Level;

    .line 42
    const/4 v0, 0x5

    new-array v0, v0, [Lio/sentry/event/Breadcrumb$Level;

    sget-object v1, Lio/sentry/event/Breadcrumb$Level;->DEBUG:Lio/sentry/event/Breadcrumb$Level;

    aput-object v1, v0, v3

    sget-object v1, Lio/sentry/event/Breadcrumb$Level;->INFO:Lio/sentry/event/Breadcrumb$Level;

    aput-object v1, v0, v4

    sget-object v1, Lio/sentry/event/Breadcrumb$Level;->WARNING:Lio/sentry/event/Breadcrumb$Level;

    aput-object v1, v0, v5

    sget-object v1, Lio/sentry/event/Breadcrumb$Level;->ERROR:Lio/sentry/event/Breadcrumb$Level;

    aput-object v1, v0, v6

    sget-object v1, Lio/sentry/event/Breadcrumb$Level;->CRITICAL:Lio/sentry/event/Breadcrumb$Level;

    aput-object v1, v0, v7

    sput-object v0, Lio/sentry/event/Breadcrumb$Level;->$VALUES:[Lio/sentry/event/Breadcrumb$Level;

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
    .line 75
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 76
    iput-object p3, p0, Lio/sentry/event/Breadcrumb$Level;->value:Ljava/lang/String;

    .line 77
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/sentry/event/Breadcrumb$Level;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 42
    const-class v0, Lio/sentry/event/Breadcrumb$Level;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/sentry/event/Breadcrumb$Level;

    return-object v0
.end method

.method public static values()[Lio/sentry/event/Breadcrumb$Level;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lio/sentry/event/Breadcrumb$Level;->$VALUES:[Lio/sentry/event/Breadcrumb$Level;

    invoke-virtual {v0}, [Lio/sentry/event/Breadcrumb$Level;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/sentry/event/Breadcrumb$Level;

    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lio/sentry/event/Breadcrumb$Level;->value:Ljava/lang/String;

    return-object v0
.end method
