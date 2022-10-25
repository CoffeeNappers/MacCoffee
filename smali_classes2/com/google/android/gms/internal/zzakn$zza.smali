.class public final enum Lcom/google/android/gms/internal/zzakn$zza;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzakn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/android/gms/internal/zzakn$zza;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum bgk:Lcom/google/android/gms/internal/zzakn$zza;

.field public static final enum bgl:Lcom/google/android/gms/internal/zzakn$zza;

.field public static final enum bgm:Lcom/google/android/gms/internal/zzakn$zza;

.field public static final enum bgn:Lcom/google/android/gms/internal/zzakn$zza;

.field private static final synthetic bgo:[Lcom/google/android/gms/internal/zzakn$zza;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzakn$zza;

    const-string/jumbo v1, "Overwrite"

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzakn$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzakn$zza;->bgk:Lcom/google/android/gms/internal/zzakn$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzakn$zza;

    const-string/jumbo v1, "Merge"

    invoke-direct {v0, v1, v3}, Lcom/google/android/gms/internal/zzakn$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzakn$zza;->bgl:Lcom/google/android/gms/internal/zzakn$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzakn$zza;

    const-string/jumbo v1, "AckUserWrite"

    invoke-direct {v0, v1, v4}, Lcom/google/android/gms/internal/zzakn$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzakn$zza;->bgm:Lcom/google/android/gms/internal/zzakn$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzakn$zza;

    const-string/jumbo v1, "ListenComplete"

    invoke-direct {v0, v1, v5}, Lcom/google/android/gms/internal/zzakn$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzakn$zza;->bgn:Lcom/google/android/gms/internal/zzakn$zza;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/google/android/gms/internal/zzakn$zza;

    sget-object v1, Lcom/google/android/gms/internal/zzakn$zza;->bgk:Lcom/google/android/gms/internal/zzakn$zza;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/gms/internal/zzakn$zza;->bgl:Lcom/google/android/gms/internal/zzakn$zza;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/android/gms/internal/zzakn$zza;->bgm:Lcom/google/android/gms/internal/zzakn$zza;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/android/gms/internal/zzakn$zza;->bgn:Lcom/google/android/gms/internal/zzakn$zza;

    aput-object v1, v0, v5

    sput-object v0, Lcom/google/android/gms/internal/zzakn$zza;->bgo:[Lcom/google/android/gms/internal/zzakn$zza;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/zzakn$zza;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzakn$zza;->bgo:[Lcom/google/android/gms/internal/zzakn$zza;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/zzakn$zza;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzakn$zza;

    return-object v0
.end method
