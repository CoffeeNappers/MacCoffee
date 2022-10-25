.class final enum Lcom/google/android/gms/internal/zzalk$zza;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzalk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/android/gms/internal/zzalk$zza;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum bhP:Lcom/google/android/gms/internal/zzalk$zza;

.field public static final enum bhQ:Lcom/google/android/gms/internal/zzalk$zza;

.field private static final synthetic bhR:[Lcom/google/android/gms/internal/zzalk$zza;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzalk$zza;

    const-string/jumbo v1, "LEFT"

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzalk$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzalk$zza;->bhP:Lcom/google/android/gms/internal/zzalk$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzalk$zza;

    const-string/jumbo v1, "RIGHT"

    invoke-direct {v0, v1, v3}, Lcom/google/android/gms/internal/zzalk$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzalk$zza;->bhQ:Lcom/google/android/gms/internal/zzalk$zza;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/android/gms/internal/zzalk$zza;

    sget-object v1, Lcom/google/android/gms/internal/zzalk$zza;->bhP:Lcom/google/android/gms/internal/zzalk$zza;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/gms/internal/zzalk$zza;->bhQ:Lcom/google/android/gms/internal/zzalk$zza;

    aput-object v1, v0, v3

    sput-object v0, Lcom/google/android/gms/internal/zzalk$zza;->bhR:[Lcom/google/android/gms/internal/zzalk$zza;

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

.method public static values()[Lcom/google/android/gms/internal/zzalk$zza;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzalk$zza;->bhR:[Lcom/google/android/gms/internal/zzalk$zza;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/zzalk$zza;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzalk$zza;

    return-object v0
.end method
